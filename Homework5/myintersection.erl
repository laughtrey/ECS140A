-module(myintersection).
-import(mymember,[mymember/2]).
-export([myintersection/2]).

%The character patterns aren't matching to return "".
myintersection(_,"") -> "";
myintersection("",_) -> "";
myintersection(_,[]) -> [];
myintersection([],_) -> [];
myintersection(L1, L2) -> myintersection(L1, L2, []).

myintersection([], _, L) -> L;
myintersection([H|T], L1, L) ->
    case mymember:mymember(H,L1) of
        true  -> myintersection(T, L1, [H|L]);
        false -> myintersection(T, L1, L)
    end.