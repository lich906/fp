getNum :: IO Int
getNum = readLn

generateNumbers :: Int -> Int -> Int -> [Int]
generateNumbers start n mult = take n $ filter (\x -> (x `mod` mult) == 0) [start..]

main :: IO ()
main = do
    putStrLn "Enter initial number..."
    initNumber <- getNum
    putStrLn "Enter quantity of numbers..."
    quantity <- getNum
    putStrLn "Enter the number that the list items should be multiplies of..."
    multiplier <- getNum
 
    print $ generateNumbers initNumber quantity multiplier
