accumulate :: Eq a => [a] -> [a] -> [a]
accumulate [] xs = xs
accumulate xs [] = xs
accumulate acc (x:xs) = (if not (elem x acc) then [x] else []) ++ accumulate acc xs

myunion :: Eq a => [a] -> [a] -> [a]
myunion xs ys = accumulate (accumulate [] xs) ys

main :: IO()
main = print (myunion [1,2,3,4] [3,2,1,0,5,6])
