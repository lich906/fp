myLength :: [a] -> Int
myLength xs = len xs 0
    where
        len []     acc = acc
        len (_:xs) acc = len xs $! (1 + acc)

myInsert :: [Int] -> Int -> Int -> [Int]
myInsert l a n
    | n < 0 = l
    | myLength l <= n = myInsert l a (n - 1)
    | otherwise = insertHandler l a n
    where
        insertHandler l a n = take n l ++ [a] ++ drop n l

main :: IO()
main = do
    let inputList = [5, 3, 42]
    print $ myInsert inputList 12 2
