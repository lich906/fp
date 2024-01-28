oddEven :: [a] -> [a]
oddEven [] = []
oddEven [x] = [x]
oddEven (x:y:xs) = y:[x] ++ oddEven xs

main :: IO()

main = do
    let inputList = [2,5,7,9,1,8] :: [Int]
    print $ oddEven inputList