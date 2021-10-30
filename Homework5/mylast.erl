-module(mylast).
-export([mylast/1]).

mylast([])      -> [];
mylast("")      -> "";
mylast([H|[]])  -> [H];
mylast([_|T])   -> mylast(T).