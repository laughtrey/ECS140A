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
