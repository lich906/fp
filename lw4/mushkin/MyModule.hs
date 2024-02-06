module MyModule where

import Prelude(Bool, Ord, Eq, Char, elem, not, otherwise, fst, any, (==), (++), (.))
import qualified Data.List as List
import qualified Data.Map as Map
import qualified Data.Set as Set

-- Data.List.zip
zip :: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys

-- Data.List.delete
delete :: (Eq a) => a -> [a] -> [a]
delete _ [] = []
delete v (x:xs)
    | v == x = delete v xs
    | otherwise = x:delete v xs

-- Data.List.break
break :: (Ord a) => (a -> Bool) -> [a] -> ([a], [a])
break p [] = ([], [])
break p (x:xs)
    | not (p x) = breakImpl p xs [x]
    | p x = ([], x:xs)
    where
        -- breakImpl            predicate      list   past
        breakImpl :: (Ord a) => (a -> Bool) -> [a] -> [a] -> ([a], [a])
        breakImpl _ [] past = (past, [])
        breakImpl p (x:xs) past
            | not (p x) = breakImpl p xs (past ++ [x])
            | p x = (past, x:xs)

-- Data.Map.member
member :: (Eq k) => k -> Map.Map k v -> Bool
member k m = any ((==k) . fst) (Map.toList m)

-- Data.Set.insert
insert :: (Ord a) => a -> Set.Set a -> Set.Set a
insert v s = Set.fromList (v : (Set.toList s))

-- Data.Char.isUpper
isUpper :: Char -> Bool
isUpper c = elem c ['A'..'Z']
