main :: IO ()
main = do
    let list1 = ['a', 'b', 'c']
    let list2 = [['a', 'b'], ['c','d']]
    let list3 = [['a', 'c', 'd'], ['a','b']]
    let list4 = [['a','d'], ['b', 'c']]

    print $ head (tail list1)
    print $ head (tail (head list2))
    print $ head (tail (head (tail list3)))
    print $ head (head (tail list4))
