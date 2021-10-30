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
