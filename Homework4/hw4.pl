% #1
shuffle([],[],[]).
shuffle([H1|T1],[H2|T2],[H1,H2|T3]) :- shuffle(T1,T2,T3).
% #2
double([],[]).
double([H1|T1],[H1,H1|T2]) :- double(T1,T2).
% #3
newmember(H, [H | T]).
newmember(X, [H | T]) :- newmember(X,T).
no_duplicates([],[]).
no_duplicates([X1|XT1], [Y1|YT1]) :- newmember(X1,XT1), no_duplicates(XT1, [Y1 | YT1]). 
no_duplicates([X1|XT1], [X1|YT1]) :- not(newmember(X1,XT1)), no_duplicates(XT1, YT1).
% #4
same_elements(L1, L2) :- maplist(same_element(L2), L1).
same_element(L, X) :- newmember(X, L).