main :: IO()

f :: Int -> Int
f n = sum [n-i | i <- [1..n]]

main = do
    print (f 5)