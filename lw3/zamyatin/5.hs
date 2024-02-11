getElem :: [[a]] -> Int -> [a]
getElem xss n = map (!! n) xss

main :: IO()
main = print $ getElem [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 2