main :: IO ()

method1 :: Int -> [Int]
method1 n = [x | x <- [1..n*2], odd x]

method2 :: Int -> [Int]
method2 n = [2*x-1 | x <- [1..n]]

method3 :: Int -> [Int]
method3 n = map ((subtract 1) . (*2)) [1..n]

main = do
    print (method1 20)
    print (method2 20)
    print (method3 20)
