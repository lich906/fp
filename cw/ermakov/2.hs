elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices element elements = do
    let elementsWithIndices = zip elements [0..]
    [i | (x, i) <- elementsWithIndices, x == element]

main :: IO()
main = do
    print $ elemIndices 5 [1, 5, 5]
    print $ elemIndices 50 [1, 5, 5]
