import Data.List
getNum :: IO Int
getNum = readLn

formList::Int->Int->Int->[Int]
formList start size step 
    | start `mod` step > 0 = formList (head (filter (\x -> (x `mod` step) == 0) [start..start + step])) size step
    | otherwise = [start, start + step.. step * size]

main :: IO()
main = do
    putStrLn "Enter initial number"
    start <- getNum
    putStrLn "Enter the size"
    size <- getNum
    putStrLn "Enter the multiplicity"
    step <- getNum
    print (formList  start size step)