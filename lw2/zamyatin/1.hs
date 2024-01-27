import Data.List (transpose)

main :: IO ()

filterIndexed :: (a -> Int -> Bool) -> [a] -> [a]
filterIndexed p xs = [x|(x,i) <- zip xs [0..], p x i]

isIndexOdd :: (a -> Int -> Bool)
isIndexOdd i = odd

isIndexEven :: (a -> Int -> Bool)
isIndexEven i = even

oddEven :: [a] -> [a]
oddEven x = concat (transpose [filterIndexed isIndexOdd x, filterIndexed isIndexEven x])

main = do
    print (oddEven [2,5,7,9,1,8])
