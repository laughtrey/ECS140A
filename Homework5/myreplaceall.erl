-module(myreplaceall).
-export([myreplaceall/3]).

myreplaceall(_,_,[])  -> [];
myreplaceall(X,Y,[H|T]) ->
    [ if H =:= Y -> X;
         true -> H
    end | myreplaceall(X,Y,T)].

%X = replace
%Y = Find