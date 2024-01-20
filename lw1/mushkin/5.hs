-- https://oeis.org/A000330

main :: IO ()

pyramidal_num :: Int -> Int
pyramidal_num i = (2*i^3+3*i^2+i)`div`6

pyramidal_nums :: Int -> [Int]
pyramidal_nums n = map pyramidal_num [1..n]

main = do
    print (pyramidal_nums 50)
