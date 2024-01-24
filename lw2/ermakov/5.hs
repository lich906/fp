sumFirstN :: Integer -> Integer
sumFirstN n
    | n < 1 = 0
    | otherwise = n * (n + 1) `div` 2

main :: IO ()
main = do
    print $ sumFirstN 10