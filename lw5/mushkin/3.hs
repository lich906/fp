import System.Environment
import System.Directory
import System.IO
import Data.List
import Data.Char

-- helper function
badCmdSyntax :: IO ()
badCmdSyntax = putStrLn "Invalid command syntax. Use 'help' command for info."

--     file        args
add :: FilePath -> [String] -> IO ()
add file [] = do
    putStrLn "Enter line to be appended to file..."
    str <- getLine
    appendFile file (str ++ "\n")
    putStrLn ("Appended line '"++str++"' to the end of file.")
add _ _ = badCmdSyntax

--            file        args
deleteLine :: FilePath -> [String] -> IO ()
deleteLine fileName [numberString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        contentLines = lines contents
    if number > length contentLines
    then putStrLn "Line number exceeds line count." >> return()
    else do
        let newTodoItems = delete (contentLines !! (number-1)) contentLines
        hPutStr tempHandle $ unlines newTodoItems
        hClose handle
        hClose tempHandle
        removeFile fileName
        renameFile tempName fileName
deleteLine _ _ = badCmdSyntax

--      file        args
view :: FilePath -> [String] -> IO ()
view file [] = readFile file >>= putStr
view _ _ = badCmdSyntax

--            file        args
filterFile :: FilePath -> [String] -> IO ()
filterFile file [mode, outFile] = do
    content <- readFile file
    case mode of
        "remove_whitespaces" -> writeFile outFile (filter (not . isSpace) content)
        "to_lower" -> writeFile outFile (map toLower content)
        _ -> putStrLn "Unknown filtering mode."
filterFile _ _ = badCmdSyntax

help :: [String] -> IO ()
help _ = putStrLn "Commands:\n\
    \ \tadd STRING - append specified string to the end of file\n\
    \ \tview - print file contents\n\
    \ \thelp - print this help message\n\
    \ \tdelete LINE_NUM - delete specific line\n\
    \ \tfilter (remove_whitespaces|to_lower) RESULT_FILE - apply filtering for file contents and save result to file\n\
    \ \texit - exit program"

--          file        commands Map
dispatch :: FilePath -> [(String, [String] -> IO ())]
dispatch file = [
                    ("add", add file),
                    ("view", view file),
                    ("filter", filterFile file),
                    ("delete", deleteLine file),
                    ("help", help)
                ]

processInput :: String -> String -> IO Bool
processInput file "" = return True
processInput file input
    | length inputParts == 0 = return True
    | otherwise = do
        let (command:args) = inputParts
        case command of
            "exit" -> putStrLn "Bye." >> return False
            _ -> do
                let maybeAction = lookup command (dispatch file)
                case maybeAction of
                    Nothing -> putStrLn ("Unknown command '"++command++"'") >> return True
                    Just action -> action args >> return True
    where inputParts = words input

mainLoop :: FilePath -> IO ()
mainLoop file = do
    input <- getLine
    continue <- processInput file input
    if continue then mainLoop file else return()

main :: IO ()
main = do
    args <- getArgs
    progName <- getProgName
    if (length args /= 1) then error ("Invalid arguments.\nUsage: "++progName++" INPUT_FILE\n") else return()
    let (file:_) = args
    help []
    mainLoop file
