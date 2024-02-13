import System.Environment
import Data.List

nextMultiple :: Int -> Int -> Int
nextMultiple start multi = start + (multi - (start `mod` multi)) `mod` multi

generateList :: Int -> Int -> Int -> [Int]
generateList start count mult = do
   let startMultiple = nextMultiple start mult
   take count [startMultiple, startMultiple + mult ..]

main = do
   args <- getArgs
   let startNum = read (args !! 0) :: Int
   let count = read (args !! 1) :: Int
   let multiplicity = read (args !! 2) :: Int
   print $ generateList startNum count multiplicity