main :: IO()

insert :: [a] -> a -> Int -> [a]
insert list el pos
    | pos < 0 = error "position cannot be negative"
    | length list < pos = error "position exceeds list length"
    | length list == pos = list ++ [el]
    | otherwise = before ++ [el] ++ after
    where
        before = take pos list
        after = drop pos list

main = do
    let list = [1, 2, 3, 5, 6, 7]
    print (insert list 4 3)
    print (insert list 4 6)
