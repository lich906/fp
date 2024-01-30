main :: IO()

listnums :: Int -> [Int]
listnums n
    | n < 1 = []
    | otherwise = n : listnums (n - 1)

main = do
    print (listnums 42)
    print (listnums 0)
    print (listnums (-1))
    print (listnums 1)