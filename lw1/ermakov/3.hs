oddNumbers3 :: Int -> [Int]
oddNumbers3 count = takeOdd 1 count
    where
        takeOdd n 0 = []
        takeOdd n c = n : takeOdd (n + 2) (c - 1)

main :: IO ()
main = do
    let oddNumbers1 = take 20 [x | x <- [1..], odd x]
    let oddNumbers2 = take 20 [1,3..]

    print oddNumbers1
    print oddNumbers2
    print $ oddNumbers3 20