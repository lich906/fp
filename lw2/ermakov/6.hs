f :: Integral a => a -> a
f n
    | n < 1 = 0
    | otherwise = sum [0..n-1]

main :: IO ()
main = do
    print $ f 5