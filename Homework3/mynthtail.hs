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
