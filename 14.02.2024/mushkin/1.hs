partitionN :: [a] -> Int -> [[a]]
partitionN [] _ = []
partitionN _ n | n <= 0 = error "Number of sublists must be greater than 0"
partitionN list n
    | n <= 0 = error "Number of sublists must be greater than 0"
    | count == 0 = error "Number of sublists exceeds length of initial list"
    | otherwise = partitionNImpl count [] list
    where
        count = (length list) `div` n
        --                count  acc      rest
        partitionNImpl :: Int -> [[a]] -> [a] -> [[a]]
        partitionNImpl _ acc [] = acc
        partitionNImpl count acc rest = do
            partitionNImpl count (acc ++ [take count rest]) (drop count rest)

main :: IO ()
main = do
    print $ partitionN [1,2,3,4,5,6,7] 3
    print $ partitionN [1,2,3,4,5,6,7] 5
    print $ partitionN [1,2,3,4,5,6,7] 1
--    print $ partitionN [1] 2       will result in error
--    print $ partitionN [1,2,3] 0   will result in error
