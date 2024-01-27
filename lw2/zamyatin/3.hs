main :: IO ()

getMinTail :: [a] -> [a] ->[a]
getMinTail x y  = if length x < length y then drop (length x) y else drop (length y) x

listSum :: Num a => [a]->[a]->[a]
listSum x y = zipWith (+) x y ++ getMinTail x y

main = do
    print (listSum [1, 1, 1] [2, 2, 2])