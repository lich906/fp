main :: IO ()

main = do
    let list1 = ['a', 'b', 'c']
    print (head (tail list1))
    let list2 = [['a', 'b'], ['c', 'd']]
    print (head (tail (head list2)))
    let list3 = [['a', 'c', 'd'], ['a', 'b']]
    print (head (tail (head (tail list3))))
    let list4 = [['a', 'd'], ['b', 'c']]
    print (head (head (tail list4)))
