myremovedduplicates :: (Eq a) => [a] -> [a]
myremovedduplicates list1
  | list1 == []                  = list1
  | head list1 `elem` tail list1 = myremovedduplicates (tail list1)
  | otherwise                    = head list1 : myremovedduplicates (tail list1)

myremovedduplicates_pm :: (Eq a) => [a] -> [a]
myremovedduplicates_pm [] = []
myremovedduplicates_pm (x : xs) | x `elem` xs = myremovedduplicates_pm xs
                                | otherwise   = x : myremovedduplicates_pm xs

myintersection :: (Eq a) => [a] -> [a] -> [a]
myintersection list1 list2
  | list1 == []             = []
  | list2 == []             = []
  | head list1 `elem` list2 = head list1 : (myintersection (tail list1) list2)
  | otherwise               = myintersection (tail list1) (list2)

myintersection_pm :: (Eq a) => [a] -> [a] -> [a]
myintersection_pm [] [] = []
myintersection_pm _  [] = []
myintersection_pm [] _  = []
myintersection_pm (x : xs) (y : ys)
  | x `elem` (y : ys) = x : myintersection_pm xs (y : ys)
  | otherwise         = myintersection_pm xs (y : ys)

mynthtail :: (Eq a) => Int -> [a] -> [a]
mynthtail n list | null list = list
                 | n == 0    = list
                 | otherwise = mynthtail (n - 1) (tail list)

mynthtail_pm :: (Eq a) => Int -> [a] -> [a]
mynthtail_pm n [] = []
mynthtail_pm n (x : xs) | n == 0    = (x : xs)
                        | otherwise = mynthtail_pm (n - 1) (xs)
-- mynthtail_pm :: (Eq a) => Int -> [a] -> [a]
-- mynthtail_pm n [] = []
-- mynthtail_pm null (x : xs)    = (x : xs)
-- mynthtail_pm n (x:xs) = mynthtail_pm (n - 1) (xs) - I get a compilation error, Pattern match is redundant on this line but I don't see why.

mylast :: (Eq a) => [a] -> [a]
mylast list | null list        = []
            | null (tail list) = [head list]
            | otherwise        = mylast (tail list)

mylast_pm :: (Eq a) => [a] -> [a]
mylast_pm [] = []
mylast_pm (x : xs) | null xs   = [x]
                   | otherwise = mylast_pm xs

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
myreverse_pmhelper (x : xs) (y:ys)     = myreverse_pmhelper xs (x : (y:ys))

myreplaceall :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall replace find list
  | null list         = []
  | find == head list = myreplaceall replace find (replace : tail list)
  | otherwise         = head list : myreplaceall replace find (tail list)

myreplaceall_pm :: (Eq a) => a -> a -> [a] -> [a]
myreplaceall_pm replace find [] = []
myreplaceall_pm replace find (x : xs)
  | find == x = myreplaceall_pm replace find (replace : xs)
  | otherwise = x : myreplaceall replace find xs

myordered :: (Ord a) => [a] -> Bool
myordered list | null list                     = True
               | null (tail list)              = True
               | head list <= head (tail list) = myordered (tail list)
               | head list == head (tail list) = True
               | otherwise                     = False

myordered_pm :: (Ord a) => [a] -> Bool
myordered_pm []  = True
myordered_pm [x] = True
myordered_pm (x : y : xs) | x <= y    = myordered_pm (y : xs)
                          | otherwise = False
