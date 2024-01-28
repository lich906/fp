listSumm :: Num a => [a] -> [a] -> [a]
listSumm l1 l2 = zipWith (+) l1 l2 ++ remaining l1 l2
  where
    remaining [] _ = []
    remaining _ [] = []
    remaining l1 l2
      | length l1 > length l2 = drop (length l2) l1
      | otherwise = drop (length l1) l2

main :: IO ()
main = do
    let list1 = [1, 2, 3, 4]
    let list2 = [5, 6, 7]
    print $ listSumm list1 list2  -- Вывод: [6, 8, 10, 4]