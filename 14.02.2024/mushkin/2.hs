elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices elem [] = []
elemIndices elem list = filter (\i -> (list !! i) == elem) [0..(length list)-1]

main :: IO ()
main = print $ elemIndices 'x' "aebbinsiaauydva"
