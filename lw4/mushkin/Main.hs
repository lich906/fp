import MyModule(zip, delete, break, member, insert, isUpper)
import qualified Data.Map as Map
import qualified Data.Set as Set

main :: IO()
main = do
    print $ MyModule.zip [1, 2, 3, 4, 5] [6, 7, 8] -- [(1,6),(2,7),(3,8)]

    print $ MyModule.delete 'h' "hi out there!" -- "i out here!"

    print $ MyModule.break (==4) [1, 2, 3, 4, 5, 6, 7] -- ([1,2,3],[4,5,6,7])

    print $ MyModule.member 3 (Map.fromList [(2, 'a'), (3, 'b'), (7, 'e')]) -- True
    print $ MyModule.member 3 (Map.fromList [(2, 'a'), (4, 'b'), (7, 'e')]) -- False

    print $ MyModule.insert 3 (Set.fromList [1,2,4]) -- fromList [1,2,3,4]
    print $ MyModule.insert 3 (Set.fromList [1,2,3]) -- fromList [1,2,3]

    print $ MyModule.isUpper 'A' -- True
    print $ MyModule.isUpper 'a' -- False
