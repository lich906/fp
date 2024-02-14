-- Итерируемся в порядке возрастания списка (в порядке индексов, => foldl), аккумулируем результат и индекс.
-- При совпадении элемента входного списка с необходимым вносим индекс в результат

elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices _ [] = []
elemIndices needle haystack =
  fst (foldl (\(mentions, elementIndex) element ->
    if element == needle
      then (mentions ++ [elementIndex], elementIndex + 1)
      else (mentions, elementIndex + 1)
  ) ([], 0) haystack)

main :: IO ()
main = do

-- отработка программы
print (elemIndices 25 [25, 130, 125, 60, 25, 25, 40, 70, 50, 75])
print (elemIndices 10 [25, 130, 125, 60, 25, 25, 40, 70, 50, 75])