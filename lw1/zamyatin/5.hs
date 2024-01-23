main :: IO ()

getPyramidalNum :: Int -> Int
getPyramidalNum x = (2*x^3+3*x^2+x)`div`6

getPyramidalNumList :: Int -> [Int]
getPyramidalNumList x = if x == 1 then [1] else getPyramidalNumList (x - 1) ++ [getPyramidalNum x]

main = do
    print (getPyramidalNumList 50)