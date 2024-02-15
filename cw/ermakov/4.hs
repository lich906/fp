import System.IO
import Data.List
import Data.Ord
import qualified Data.Map as Map
import System.Environment

-- Функция для чтения файла, подсчёта слов и записи результата
processFile :: FilePath -> FilePath -> IO ()
processFile inputFile outputFile = do
    -- Чтение и обработка файла
    text <- readFile inputFile
    let wordsList = words text
    let wordsMap = foldl (\acc word -> Map.insertWith (+) word 1 acc) Map.empty wordsList
    let sortedWords = sortBy (comparing (Down . snd)) $ Map.toList wordsMap

    -- Запись результата в файл
    writeFile outputFile $ unlines $ map (\(word, count) -> word ++ ":" ++ show count) sortedWords

main :: IO ()
main = do
    args <- getArgs
    case args of
        [inputFile, outputFile] -> processFile inputFile outputFile
        _ -> putStrLn "Usage: program <inputFile> <outputFile>"
