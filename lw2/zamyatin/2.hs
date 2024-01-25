main :: IO ()
insert :: [a] -> a -> Int -> [a]
insert l a n = take n l ++ [a] ++ drop n l

main = do
    print (insert [2,5,7,9,1,8] 333 2)