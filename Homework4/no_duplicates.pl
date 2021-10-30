newmember(H, [H | T]).
newmember(X, [H | T]) :- newmember(X,T).
no_duplicates([],[]).
no_duplicates([X1|XT1], [Y1|YT1]) :- newmember(X1,XT1), no_duplicates(XT1, [Y1 | YT1]). 
no_duplicates([X1|XT1], [X1|YT1]) :- not(newmember(X1,XT1)), no_duplicates(XT1, YT1).
