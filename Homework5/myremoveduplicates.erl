-module(myremoveduplicates).
-export([myremoveduplicates/1]).

myremoveduplicates([])    -> [];
myremoveduplicates([H|T]) -> [H | [X || X <- myremoveduplicates(T), X /= H]].