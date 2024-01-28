do_my_list :: Int-> [Int]
do_my_list start = [start..2 * start - 1]

main :: IO()

main = do
    print $ do_my_list 4