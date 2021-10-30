-module(mymember).
-export([mymember/2]).

mymember(H, [H|_])   -> true;
mymember(H, [_|Tail]) -> mymember(H, Tail);
mymember(_, [])      -> false.