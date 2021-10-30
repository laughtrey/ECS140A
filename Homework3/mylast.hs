mylast :: (Eq a) => [a] -> [a]
mylast list | null list        = []
            | null (tail list) = [head list]
            | otherwise        = mylast (tail list)

mylast_pm :: (Eq a) => [a] -> [a]
mylast_pm [] = []
mylast_pm (x : xs) | null xs   = [x]
                   | otherwise = mylast_pm xs
