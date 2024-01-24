main :: IO ()

getOddNumsFromTo x y
  | y <= x = []
  | odd x = x : getOddNumsFromTo (x + 1) y
  | otherwise = getOddNumsFromTo (x + 1) y

getOddNumsTo y = if y >= 3
        then if odd y
            then [1, 3..y]
            else [1, 3..y-1]
        else [1]

getOddNumsTo2 y = if odd y
    then [y, y-2..1]
    else [y-1, y-3..1]

main = do
    print (getOddNumsFromTo 1 20)

    print (getOddNumsTo 20)

    print (getOddNumsTo2 20)