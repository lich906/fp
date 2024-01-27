main :: IO()

mysubst :: (Eq a) => [a] -> [a] -> [a]
mysubst firstList secondList = filter (`notElem` secondList) firstList

main = print $ mysubst [1,2,3] [4,5,3]
