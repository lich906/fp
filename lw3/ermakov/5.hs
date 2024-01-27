main :: IO()

mynth :: Int -> [[a]] -> [a]
mynth n inputList = map (!!n) inputList

main = print $ mynth 2 [[1,2,3],[4,5,77]]
