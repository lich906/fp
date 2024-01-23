main :: IO ()

main = do
    let input1 = ['a', 'b', 'c']
    let result1 = head (tail input1)
    print result1

    let input2 = [['a', 'b'], ['c','d']]
    let result2 = head (tail (head input2))
    print result2

    let input3 = [['a', 'c', 'd'], ['a','b']]
    let result3 = head (tail (head (tail input3)))
    print result3

    let input4 = [['a','d'], ['b', 'c']]
    let result4 = head (head (tail input4))
    print result4