elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices x xs = fst (foldr (\t (result, i) -> if t == x then (result ++ [i], i + 1) else (result, i + 1)  ) ([], 0) xs)

main :: IO()
main = print (elemIndices 1 [1, 2, 3, 1, 3, 4, 1])