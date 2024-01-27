main :: IO()

getPosition :: (Eq a) => [a] -> a -> Int -> Int
getPosition [] _ _ = -1
getPosition (x:xs) atom pos = if x == atom then pos else getPosition xs atom pos+1

position :: (Eq a) => [a] -> a -> Int
position list atom = getPosition list atom 0

main = do
    print (position [1, 2, 3, 4, 5] 4)
    print (position [1, 2, 3, 4, 5] 9)
