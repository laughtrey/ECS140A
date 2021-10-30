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
