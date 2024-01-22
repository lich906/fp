triangleNumbers :: Int -> [Int]
triangleNumbers count = [n * (n + 1) `div` 2 | n <- [1..count]]

main :: IO ()
main = do
    print $ triangleNumbers 50