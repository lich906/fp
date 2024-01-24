main :: IO()

f :: Int -> Int
f n = foldl1 (+) [1..n]

main = do
    print (f 5)
