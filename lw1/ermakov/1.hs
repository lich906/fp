main :: IO ()
main = do
    let inputTuple = ((1, 'a'), "abc")
    print (snd (fst inputTuple))