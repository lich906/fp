main :: IO()

secondlastlist :: [[a]] -> [a]
secondlastlist (x:xs)
    | null x = []
    | otherwise = last x : secondlastlist xs

main = print $ secondlastlist [[1,2,3],[]]
