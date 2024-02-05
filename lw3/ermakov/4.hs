main :: IO()

mysubst :: (Eq a) => [a] -> [a] -> [a]
mysubst firstList [] = firstList
mysubst [] secondList = []
mysubst (x:xs) secondList
    | x `notElem` secondList = x : mysubst xs secondList
    | otherwise = mysubst xs secondList

main = print $ mysubst [1,2,3] [4,5,3]
