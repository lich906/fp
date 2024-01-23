main :: IO ()

main = do
    let input = (( 1, 'a'), "abc")
    let firstElement = fst input
    let result = snd firstElement
    print result