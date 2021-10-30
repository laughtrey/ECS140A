isPrime n primelist

   | elem n primelist = True

   | otherwise           = False

sieve (x:xs) = x : sieve [y | y <- xs, y `mod` x > 0]