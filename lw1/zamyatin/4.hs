main :: IO ()

getFermNum:: Int->Int
getFermNum x = x * ( x + 1 ) `div` 2

getFermNumsList:: Int->[Int]
getFermNumsList x = if x == 1 then [1] else  getFermNumsList (x - 1) ++ [getFermNum x]


main = do
    print (getFermNumsList 50)