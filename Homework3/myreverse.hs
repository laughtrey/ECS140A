myreverse :: (Eq a) => [a] -> [a]
myreverse list = myreversehelper list []

myreversehelper :: (Eq a) => [a] -> [a] -> [a] --iterates over the list only once
myreversehelper list1 list2
    | null list1 = list2
    | otherwise  = myreversehelper (tail list1) (head list1 : list2)

myreverse_pm :: (Eq a) => [a] -> [a]
myreverse_pm (x : xs) = myreverse_pmhelper (x : xs) []

myreverse_pmhelper :: (Eq a) => [a] -> [a] -> [a]
myreverse_pmhelper []       (x : xs) = (x : xs)
myreverse_pmhelper (x : xs) list     = myreverse_pmhelper xs (x : list)
