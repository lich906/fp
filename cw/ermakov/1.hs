partitionN :: [a] -> Int -> [[a]]
partitionN [] _ = []
partitionN _ n | n <= 0 = error "Number of sublists must be greater than 0"
partitionN lst n | length lst `div` n == 0 = error "List length must be greater than sublists count"
partitionN lst n =
    let q = length lst `div` n
        -- Функция для получения размера подсписка: базовая длина +1, если индекс подсписка меньше остатка
        sublistSize index = q
        -- Вспомогательная функция для создания подсписков
        createSublists :: [a] -> Int -> [[a]]
        createSublists [] _ = []
        createSublists lst 0 = [lst]
        createSublists remainingList index =
            let size = sublistSize index
            in take size remainingList : createSublists (drop size remainingList) (index - 1)
    in createSublists lst n


main :: IO()
main = do
    print $ partitionN [1,2,3,4,5,6,7] 3
    print $ partitionN [1,2,3,4,5,6,7] 5
    print $ partitionN [1,2,3,4,5,6,7] 1
    print $ partitionN [1] 2