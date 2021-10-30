-module(myreverse).
-export([myreverse/1]).

myreverse([])       -> [];
myreverse(L)        -> myreverse(L,[]).
myreverse([],X)     -> X;
myreverse([H|T],X)  -> myreverse(T,[H|X]). 