powerLists :: Int -> Int -> [[Int]]
powerLists listCount maxNumber =
    [ [j^i | i <- [1..listCount]] | j <- [1..maxNumber]]

main :: IO()
main = do
    print $ powerLists (6) (-4)
    print $ powerLists (-6) (-4)
    print $ powerLists (-6) (4)
    print $ powerLists (6) (4)
