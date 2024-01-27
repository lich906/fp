main :: IO()

myunion :: (Eq a) => [a] -> [a] -> [a]
myunion firstList secondList = filter (`notElem` secondList) firstList ++ secondList

main = print $ myunion [1,2,3] [4,5,3]
