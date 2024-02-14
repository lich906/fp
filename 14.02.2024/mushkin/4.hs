import System.Environment
import System.Directory
import System.IO
import qualified Data.Map as Map
import Data.List (sortBy)

type WordsMap = Map.Map String Int

getWordsCount :: FilePath -> IO WordsMap
getWordsCount file = do
   content <- readFile file
   let wordsList = words content
   return $ foldl accountWord Map.empty wordsList
   where
       accountWord :: WordsMap -> String -> WordsMap
       accountWord map word = Map.insertWith (+) word 1 map

sortPairsDesc :: [(String, Int)] -> [(String, Int)]
sortPairsDesc = sortBy (\(_,a) (_,b) -> compare b a)

printResult :: FilePath -> [(String, Int)] -> IO ()
printResult file [] = return()
printResult file (x:xs) = do
    let
        word = fst x
        count = snd x
        line = word ++ ":" ++ (show count)
    appendFile file (line ++ "\n")
    printResult file xs

main :: IO ()
main = do
    (inFile:outFile:_) <- getArgs
    wordsStats <- getWordsCount inFile
    let sortedStats = sortPairsDesc $ Map.toList wordsStats
    printResult outFile sortedStats
