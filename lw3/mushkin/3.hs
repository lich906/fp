myunion :: Eq a => [a] -> [a] -> [a]
myunion [] xs = xs
myunion xs [] = xs
myunion acc (x:xs) = (if not (elem x acc) then [x] else []) ++ myunion acc xs

main :: IO()
main = print (myunion [1,2,3,4] [3,2,1,0,5,6])
