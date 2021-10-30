myremovedduplicates :: (Eq a) => [a] -> [a]
myremovedduplicates list1
  | list1 == []                  = list1
  | head list1 `elem` tail list1 = myremovedduplicates (tail list1)
  | otherwise                    = head list1 : myremovedduplicates (tail list1)

myremovedduplicates_pm :: (Eq a) => [a] -> [a]
myremovedduplicates_pm [] = []
myremovedduplicates_pm (x : xs) | x `elem` xs = myremovedduplicates_pm xs
                                | otherwise   = x : myremovedduplicates_pm xs
