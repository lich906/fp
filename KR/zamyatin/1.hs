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

--расчёт длины итогового подлиста (кроме последнего)
getSubListLenght::Int->Int->Int->Int
getSubListLenght l value n  | l - value * (n - 1) <= 0 = error "impossible to divide"
                        | l - value * (n - 1) > value = getSubListLenght l (value + 1) n
                        | otherwise = value

-- n-1 одинаковых подсписков, последний список меньше остальных
partitionN :: [a] -> Int -> [[a]]
partitionN  [] _ = []
partitionN xs n = partitionNImpl [xs] (getSubListLenght (length xs) 1 n)

main :: IO()
main = do
    print (partitionN [1,2,3,4,5] 2)
    print (partitionN [1,2,3,4,5] 3)
    print (partitionN [1,2,3,4,5,6,7, 8] 3)