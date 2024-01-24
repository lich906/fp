main :: IO()

position :: (Eq a) => [a] -> a -> Int
position list atom
    | not (elem atom list) = -1 -- item is not in the list
    | otherwise = until (\i -> list !! i == atom) (+1) 0


main = do
    print (position [1, 2, 3, 4, 5] 4)
    print (position [1, 2, 3, 4, 5] 9)
