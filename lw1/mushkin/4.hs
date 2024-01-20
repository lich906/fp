-- https://oeis.org/A000217

main :: IO ()

triangle_nums :: Int -> [Int]
triangle_nums n
    | n == 1 = [1]
    | otherwise = do
        let res = triangle_nums (n-1)
        res ++ [last res + n]

main = do
    print (triangle_nums 50)
