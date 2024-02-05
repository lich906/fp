main :: IO()

myunion :: (Eq a) => [a] -> [a] -> [a]
myunion firstList [] = firstList
myunion [] secondList = secondList
myunion (x:xs) secondList
    | x `notElem` secondList = x : myunion xs secondList
    | otherwise = myunion xs secondList

main = print $ myunion [1,2,3] [4,5,333]
