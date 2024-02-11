main :: IO()

secondlastlist :: [[a]] -> [a]
secondlastlist (x:xs)
    | null x = []
    | null xs = x
    | otherwise = last x : secondlastlist xs

main = do
    print (secondlastlist [[1,2,3],[3,2], [4]])