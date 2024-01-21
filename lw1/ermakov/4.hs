triangleNumbers :: Int -> Int -> [Int]
triangleNumbers start count =
  [n * (n + 1) `div` 2 | n <- [start..start + count - 1]]

main :: IO ()
main = do
    print $ triangleNumbers 2 50