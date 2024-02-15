-- По сути первый аргумент - максимальная степень, второй - максимальное возводимое число.
-- Итерируемся по списку от 1 до макс. числа и с помощью левой рекурсии создаём список
-- чисел, возведённых в степени от 1 до макс. указанной, который добавляется в конец аккумулятора

ascPowerList :: Int -> Int -> [[Int]]
-- Вырожденный случай - 0 чисел
ascPowerList 0 numCnt  = take numCnt (repeat [])
-- Вырожденный случай - 0 - макс число
ascPowerList _ 0 = []
ascPowerList pwr numCnt = foldl (\acc num -> acc ++ [(getPowerList num pwr)]) [] [1 .. numCnt]
  where
    getPowerList :: Int -> Int -> [Int]
    getPowerList num pwr
      | pwr > 0 = getPowerList num (pwr - 1) ++ [num ^ pwr]
      | otherwise = []

main :: IO ()
main = do

-- отработка программы
print (ascPowerList 1 1)
print (ascPowerList 1 10)
print (ascPowerList 3 4)
print (ascPowerList 0 10)
print (ascPowerList 10 0)
print (ascPowerList 10 10)