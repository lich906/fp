import Data.Foldable

takeLeftover :: [a] -> t -> [a]
takeLeftover [] _ = []
takeLeftover (x:xss) _ = xss

--возвращает список из N последних элементов
lastN' :: Int -> [a] -> [a]
lastN' n xs = foldl' takeLeftover xs (drop n xs)

--взять последний список входного списка, выделить из него N значений в отдельный список
partitionNImpl :: [[a]] -> Int-> [[a]]
partitionNImpl xxs n    | length (last xxs) <= n = xxs
                        | otherwise = partitionNImpl (take (length xxs - 1) xxs ++ [take n (last xxs)]++ [lastN' (length (last xxs) - n) (last xxs)]) n

-- n-1 одинаковых подсписков, последний список меньше остальных
partitionN :: [a] -> Int -> [[a]]
partitionN  [] _ = []
partitionN xs n | length xs `mod` n == 0 = partitionNImpl [xs] (length xs `div` n )
                | otherwise = partitionNImpl [xs] ((length xs `div` n ) + 1)

main :: IO()
main = print (partitionN [1,2,3,4,5] 2)