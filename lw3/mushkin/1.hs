listnums :: Int -> [Int]
listnums n
    | n < 1 = []
    | otherwise = n : listnums (n - 1)

main :: IO()
main = do
    print $ listnums 10
    print $ listnums 1
    print $ listnums (-1)
