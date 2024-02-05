import MyModule(zip, delete, break, member)
import qualified Data.Map as Map

main :: IO()
main = do
    print $ MyModule.zip [1, 2, 3, 4, 5] [6, 7, 8]

    print $ MyModule.delete 'h' "hi out there!"

    print $ MyModule.break (==4) [1, 2, 3, 4, 5, 6, 7]

    print $ MyModule.member 3 (Map.fromList [(2, 'a'), (3, 'b'), (7, 'e')])
    print $ MyModule.member 3 (Map.fromList [(2, 'a'), (4, 'b'), (7, 'e')])
