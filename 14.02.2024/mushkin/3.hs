listPowers :: Int -> Int -> [[Int]]
listPowers n powN = take powN $ map (\num -> getPowsList num n) [1..]
    where
        getPowsList :: Int -> Int -> [Int]
        getPowsList num n = take n $ map (\pow -> num ^ pow) [1..]

main :: IO ()
main = print $ listPowers 5 4
