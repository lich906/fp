import System.Environment
import System.IO
import Data.Char

replacePunctuationMarks :: String -> Char -> String
replacePunctuationMarks subject rChar = map (\x -> if isPunctuation x then rChar else x) subject

copyReplaceFiles :: String -> String -> Char -> IO ()
copyReplaceFiles inFile outFile replaceChar = do
    content <- readFile inFile
    writeFile outFile (replacePunctuationMarks content replaceChar)

main :: IO ()
main = do
    rawArgs <- getArgs
    let args = (head rawArgs, rawArgs !! 1)
    putStrLn "Enter character to replace punctuation marks..."
    char <- getChar
    uncurry copyReplaceFiles args char