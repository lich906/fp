import Data.List

reverseList :: [a] -> [a]
reverseList xs = foldl (\x y -> y:x) [] xs

oddEven :: [a] -> [a]
oddEven xs = reversePairs xs
    where
        reversePairs [] = []
        reversePairs [x] = [x]
        reversePairs (x:y:xs) = reverseList [x, y] ++ reversePairs xs

main :: IO()

main = do
    let inputList = [2,5,7,9,1,8] :: [Int]
    print $ oddEven inputList