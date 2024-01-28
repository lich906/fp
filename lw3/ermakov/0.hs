main :: IO()

qsort       :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) =
   qsort smaller ++ [x] ++ qsort larger
   where
      smaller = [a | a <- xs, a <= x]
      larger  = [b | b <- xs, b > x]

main = do
    let inputList = [1,20,3,4] :: [Int]
    print $ qsort inputList
