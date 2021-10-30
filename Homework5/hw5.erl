-module(hw5).
-export([mymember/2,myremoveduplicates/1,myintersection/2,mylast/1,myreverse/1,myreplaceall/3]).

%--
mymember(H, [H|_])   -> true;
mymember(H, [_|Tail]) -> mymember(H, Tail);
mymember(_, [])      -> false.

%1
myremoveduplicates([])    -> [];
myremoveduplicates([H|T]) -> [H | [X || X <- myremoveduplicates(T), X /= H]].

%2
%The character patterns aren't matching to return "".
myintersection(_,"") -> "";
myintersection("",_) -> "";
myintersection(_,[]) -> [];
myintersection([],_) -> [];
myintersection(L1, L2) -> myintersection(L1, L2, []).

myintersection([], _, L) -> L;
myintersection([H|T], L1, L) ->
    case mymember(H,L1) of
        true  -> myintersection(T, L1, [H|L]);
        false -> myintersection(T, L1, L)
    end.

%3
mylast([])      -> [];
mylast([H|[]])  -> [H];
mylast([_|T])   -> mylast(T).

%4
myreverse([])       -> [];
myreverse(L)        -> myreverse(L,[]).
myreverse([],X)     -> X;
myreverse([H|T],X)  -> myreverse(T,[H|X]). 

%5
myreplaceall(_,_,[])  -> [];
myreplaceall(X,Y,[H|T]) ->
    [ if H =:= Y -> X;
         true -> H
    end | myreplaceall(X,Y,T)].

%X = replace
%Y = Find