module MyModule where

import Prelude
import Data.Set as Set
import Data.Char as Char

--реализация Data.List.Intersect
myIntersect :: Eq a => [a] -> [a] ->[a]
myIntersect xs ys  = Prelude.filter (\x -> x `elem` ys) xs

--реализация Data.List.Filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []  = []
myFilter p (x:xs)
    | p x = x : myFilter p xs
    | otherwise = myFilter p xs

--реализация Data.Set.Difference
myDifference :: Ord a => Set.Set a -> Set.Set a -> Set.Set a
myDifference a b = Set.filter (\x -> x `notMember` b) a

--реализация Data.Char.ToUpper
myToUpper :: Char -> Char
myToUpper a | isUpper a || not (isAlpha a) = a
            | otherwise = chr (ord a - 32)

--реализация Data.Char.IsLetter
myIsLetter :: Char -> Bool
myIsLetter a = ord a >= 65 && ord a <= 122

