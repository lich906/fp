triangleNumbers :: Int -> Int -> [Int]
triangleNumbers start count =
    [n * (n + 1) `div` 2 | n <- [start..start + count - 1]]

triangleNumbersStartedWithFirst :: Int -> [Int]
triangleNumbersStartedWithFirst count = triangleNumbers 1 count

main :: IO ()
main = do
    print $ triangleNumbersStartedWithFirst 50