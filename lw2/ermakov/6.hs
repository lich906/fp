fHandler :: Integral a => a -> a -> a
fHandler n count
    | count == n = 0
    | otherwise = (n - count) + fHandler n (count + 1)

f :: Integral a => a -> a
f n
    | n < 1 = 0
    | otherwise = fHandler n 1

main :: IO ()
main = do
    print $ f 5