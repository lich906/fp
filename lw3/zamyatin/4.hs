mysubst :: Eq a => [a] -> [a] -> [a]
mysubst [] _  = []
mysubst xs [] = xs
mysubst (x:xs) ys
    | x `elem` ys = mysubst xs ys
    | otherwise = x : mysubst xs ys

main :: IO()
main = print (mysubst [1, 2, 3, 4, 5] [1, 2, 3]) 