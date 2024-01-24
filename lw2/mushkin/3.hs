main :: IO()

listSumm :: (Num a) => [a] -> [a] -> [a]
listSumm l1 l2 = do
    let minLen = min (length l1) (length l2)
    let res = map (\i -> (l1 !! i) + (l2 !! i)) [0..minLen-1]
    res ++ drop minLen (if length l2 > minLen then l2 else if length l1 > minLen then l1 else [])
main = do
    print (listSumm [1, 3, 2, 7, 5] [2, 5, 1])
