import System.Environment
import Data.List

generateList :: Int -> Int -> Int -> [Int]
generateList start count mult = take count [start, start + mult ..]

main = do
   args <- getArgs
   let startNum = read (args !! 0) :: Int
   let count = read (args !! 1) :: Int
   let multiplicity = read (args !! 2) :: Int
   print $ generateList startNum count multiplicity