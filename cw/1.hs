-- Функция проверяет наличие "остатка" - последнего подсписка, где элементов может быть меньше,
-- исходя из этого высчитывает длину равных подписков.
-- Функция выбрасывает ошибку "некорректный ввод", если
-- 1.число подсписков больше количества элементов в списке
-- 2.исходный список не делится на указанное число подсписков согласно условию задачи
-- После чего вспомогательная функция рекурсивно возвращает по одному подсписку,
-- вызывая себя с оставшейся частью входного списка до тех пор, пока не останется "остаток",
-- который оборачивается в список (получается список с подсписком-"остатком") и к которому складываются предыдущие вызовы функции

partitionN :: [a] -> Int -> [[a]]
partitionN x n
  | (n <= length x) && (remainingPartLen > partionLen) = error "Errorneous input!"
  | otherwise = partitionNImpl x partionLen
  where
    remainingPartLen = length x `mod` n
    partionLen
      | remainingPartLen == 0 = length x `div` n
      | otherwise = (length x - remainingPartLen) `div` (n - 1)
    partitionNImpl :: [a] -> Int -> [[a]]
    partitionNImpl x partionLen
      | (partionLen > 0) && (length x > partionLen) = [take partionLen x] ++ (partitionNImpl (reverse (take ((length x) - partionLen) (reverse x))) partionLen)
      | otherwise = [x]

main :: IO ()
main = do

-- отработка программы
print(partitionN [1,2,3,4,5,6,7,8] 1)
print(partitionN [1,2,3,4,5,6,7,8] 2)
print(partitionN [1,2,3,4,5,6,7,8] 3)
print(partitionN [1,2,3,4,5,6,7,8] 4)
print(partitionN [1,2,3,4,5] 1)
print(partitionN [1,2,3,4,5] 2)
print(partitionN [1,2,3,4,5] 5)

-- Выброс ошибки
print(partitionN [1,2,3,4,5] 3)
print(partitionN [1,2,3,4,5] 6)
print(partitionN [1,2,3,4,5,6,7,8] 5)
print(partitionN [1,2,3,4,5,6,7,8] 9)