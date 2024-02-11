import System.Environment
import System.IO 
import Data.Char

data Args = Args {
    inFile :: String,
    outFile :: String
} deriving (Show)

parseArgs :: String -> [String] -> Maybe Args
parseArgs progName args
    | length args /= 2 = Nothing
    | otherwise = Just $ Args (head args) (last args)

copyReplaceFiles :: String -> String -> Char -> IO ()
copyReplaceFiles inFile outFile replaceChar = do
    content <- readFile inFile
    writeFile outFile (replace content replaceChar)
    where
        replace :: String -> Char -> String
        replace subject rChar = map (\x -> if isPunctuation x then rChar else x) subject

main :: IO ()
main = do
    rawArgs <- getArgs
    progName <- getProgName
    let maybeArgs = parseArgs progName rawArgs
    case maybeArgs of
        Nothing -> error ("Invalid arguments.\nUsage: "++progName++" INPUT_FILE OUTPUT_FILE\n")
        Just args -> do
            putStrLn "Enter character which should replace punctuation marks..."
            char <- getChar
            copyReplaceFiles (inFile args) (outFile args) char
