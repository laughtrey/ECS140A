double([],[]).
double([H1|T1],[H1,H1|T2]) :- double(T1,T2).