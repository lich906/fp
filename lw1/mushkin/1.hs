main :: IO ()

main = do
    let b = (( 1, 'a'), "abc")
    print (snd (fst b))
