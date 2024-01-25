main :: IO ()

getPosition:: Eq a => [a]->a->Int->Int
getPosition l a i = if head l == a then i else getPosition (tail l) a i+1

position:: Eq a => [a]->a->Int
position l a = getPosition l a 0

main = do
    print (position [1, 2, 3] 4)