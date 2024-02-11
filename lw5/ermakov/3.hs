import System.Environment
import System.IO
import System.Directory
import Data.List

-- Определение диспетчера команд
dispatch :: [(String, [String] -> IO ())]
dispatch = [ ("view", view)
           , ("add", add)
           , ("delete", deleteLine)
           , ("copyWithFilter", copyWithFilter)
           ]

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> putStrLn "Ошибка: не указана команда. Доступные команды: view, add, delete, copyWithFilter."
        (command:argsTail) -> 
            case lookup command dispatch of
                Just action -> action argsTail
                Nothing -> putStrLn $ "Неизвестная команда: " ++ command

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ ": " ++ line) [1..] todoTasks
    putStr $ unlines numberedTasks

add :: [String] -> IO ()
add [fileName, line] = do
    appendFile fileName (line ++ "\n")
    putStrLn "Строка добавлена."

deleteLine :: [String] -> IO ()
deleteLine [fileName, numberString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        todoTasks = lines contents
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName
    putStrLn "Строка удалена."

copyWithFilter :: [String] -> IO ()
copyWithFilter [inputFile, outputFile, filterType, word] = do
    contents <- readFile inputFile
    let filteredContents = case filterType of
            "exclude" -> unlines . filter (not . isInfixOf word) . lines $ contents
            "include" -> unlines . filter (isInfixOf word) . lines $ contents
            _ -> contents
    writeFile outputFile filteredContents
    putStrLn $ "Файл '" ++ outputFile ++ "' создан."
