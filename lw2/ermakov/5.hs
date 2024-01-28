main :: IO ()

sum' :: Int -> Int
sum' n
    | n < 1 = 0
    | otherwise = sum [1..n]

main = print $ sum' 10