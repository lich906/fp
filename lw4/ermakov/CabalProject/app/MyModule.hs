module MyModule where

import qualified Data.List as List
import qualified Data.Map as Map
import qualified Data.Set as Set

-- Реализация intersperse
myIntersperse :: a -> [a] -> [a]
myIntersperse sep [] = []
myIntersperse sep [x] = [x]
myIntersperse sep (x:xs) = x : sep : myIntersperse sep xs

-- Реализация transpose
myTranspose :: [[a]] -> [[a]]
myTranspose [] = []
myTranspose ([] : xss) = myTranspose xss
myTranspose ((x:xs) : xss) = (x : [h | (h:_) <- xss]) : myTranspose (xs : [ t | (_:t) <- xss])

-- Реализация fromList для Set
myFromList :: (Ord a) => [a] -> Set.Set a
myFromList = foldr Set.insert Set.empty

-- Реализация partition
myPartition :: (a -> Bool) -> [a] -> ([a], [a])
myPartition p xs = foldr (\x (yes, no) -> if p x then (x:yes, no) else (yes, x:no)) ([], []) xs

-- Реализация intercalate
myIntercalate :: [a] -> [[a]] -> [a]
myIntercalate xs xss = concat (myIntersperse xs xss)
