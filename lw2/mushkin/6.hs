main :: IO()

f :: Int -> Int
f n = foldl1 (+) [n-i | i <- [1..n]]

main = do
    print (f 5)
