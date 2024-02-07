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
myTranspose ((x:xs) : xss) = (x : [h | (h:_) <- xss]) : myTranspose (xs : [t | (_:t) <- xss])

-- Реализация fromList для Set
myFromList :: (Ord a) => [a] -> Set.Set a
myFromList = foldr Set.insert Set.empty

-- Реализация partition
myPartition :: (a -> Bool) -> [a] -> ([a], [a])
myPartition p xs = foldr (\x (yes, no) -> if p x then (x:yes, no) else (yes, x:no)) ([], []) xs

-- Реализация intercalate
myIntercalate :: [a] -> [[a]] -> [a]
myIntercalate xs xss = concat (myIntersperse xs xss)

-- Функция, проверяющая, является ли символ шестнадцатеричной цифрой
myIsHexDigit :: Char -> Bool
myIsHexDigit c = (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F')

data Map k v = Empty
             | Node k v (Map k v) (Map k v)
             deriving (Show)

-- Проверка наличия ключа в Map
myMember :: (Ord k) => k -> Map k v -> Bool
myMember _ Empty = False
myMember key (Node k v left right)
  | key == k = True
  | key < k  = myMember key left
  | key > k  = myMember key right


