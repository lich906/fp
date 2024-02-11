import System.Environment
import System.Directory
import System.IO
import Data.List
import Data.Char

--     file        args
add :: FilePath -> [String] -> IO ()
add file _ = do
    putStrLn "Enter line to be appended to file..."
    str <- getLine
    appendFile file (str ++ "\n")
    putStrLn ("Appended line '"++str++"' to the end of file.")

--      file        args
view :: FilePath -> [String] -> IO ()
view file _ = readFile file >>= putStr

--            file        args
filterFile :: FilePath -> [String] -> IO ()
filterFile file (mode:outFile:_) = do
    content <- readFile file
    case mode of
        "remove_whitespaces" -> writeFile outFile (filter (not . isSpace) content)
        "to_lower" -> writeFile outFile (map toLower content)
        _ -> putStrLn "Unknown filtering mode."

help :: [String] -> IO ()
help _ = putStrLn "Commands:\n\
    \ \tadd STRING - append specified string to the end of file\n\
    \ \tview - print file contents\n\
    \ \thelp - print this help message\n\
    \ \tfilter (remove_whitespaces|to_lower) RESULT_FILE - apply filtering for file contents and save result to file\n\
    \ \texit - exit program"

--          file        commands Map
dispatch :: FilePath -> [(String, [String] -> IO ())]
dispatch file = [
                    ("add", add file),
                    ("view", view file),
                    ("filter", filterFile file),
                    ("help", help)
                ]
--    ("filter", filter)

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
