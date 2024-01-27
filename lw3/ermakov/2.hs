main :: IO()

secondlastlist :: [[a]] -> [a]
secondlastlist inputList = map last inputList

main = print $ secondlastlist [[1,2,3],[4,5,6]]
