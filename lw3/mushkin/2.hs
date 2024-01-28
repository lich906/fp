secondlastlist :: [[a]] -> [a]
secondlastlist [] = []
secondlastlist (xs:xss)
    | null xs = error "list element is empty"
    | otherwise = last xs : secondlastlist xss

main :: IO()
main = print $ secondlastlist [[1,3,4], [2], [3,7,6,9]]
