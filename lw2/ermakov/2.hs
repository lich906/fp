insert :: [Int] -> Int -> Int -> [Int]
insert l a n
    | n < 0 = l
    | length l <= n = insert l a (n - 1)
    | otherwise = insertHandler l a n
    where
        insertHandler l a n = take n l ++ [a] ++ drop n l

main :: IO()
main = do
    let inputList = [5, 3, 42]
    print $ insert inputList 12 2
