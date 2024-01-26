main :: IO()

f :: Int -> Int
f n = sum [1..n]

main = do
    print (f 5)