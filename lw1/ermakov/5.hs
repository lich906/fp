fermatPyramidNumbers :: Int -> [Int]
fermatPyramidNumbers count = [n * (n + 1) * (2 * n + 1) `div` 6 | n <- [1..count]]

main :: IO ()
main = do
    print $ fermatPyramidNumbers 50