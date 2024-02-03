getsublistelem :: [[a]] -> Int -> [a]
getsublistelem xss n = map (\xs -> xs !! n) xss

main :: IO()
main = print $ getsublistelem [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 1
