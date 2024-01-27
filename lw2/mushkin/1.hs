main :: IO()

oddEven :: [a] -> [a]
oddEven l
    | len == 0 = []
    | len == 1 = l
    | otherwise = do
        let snd = head (tail l)
        let fst = head l
        let rest = tail (tail l)
        snd:(fst:(oddEven rest))
    where
        len = length l

main = do
    print (oddEven [2, 5, 7, 9, 1, 8])
