main :: IO()

listnums :: Int -> [Int]
listnums n
    | n < 1 = []
    | otherwise = n : listnums (n - 1)

main = print $ listnums 13
