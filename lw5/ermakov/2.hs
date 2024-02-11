import System.Environment (getArgs)
import System.IO (readFile, writeFile)
import Data.Char (isPunctuation)

-- Функция замены знаков пунктуации на заданный символ
replacePunctuation :: Char -> String -> String
replacePunctuation newChar = map (\c -> if isPunctuation c then newChar else c)

-- Обработчик параметров и выполнение основной логики
processFiles :: String -> String -> Char -> IO ()
processFiles inputFile outputFile replacementChar = do
    content <- readFile inputFile
    writeFile outputFile $ replacePunctuation replacementChar content
    putStrLn "Файл обработан."

-- Основная функция
main :: IO ()
main = do
    args <- getArgs
    let result = case args of
            [input, output, [replacementChar]] -> Right (input, output, replacementChar)
            _ -> Left "Ошибка: необходимо указать два имени файла и один символ для замены."
    case result of
        Right (inputFile, outputFile, replacementChar) -> processFiles inputFile outputFile replacementChar
        Left errMsg -> putStrLn errMsg
