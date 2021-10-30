shuffle([],[],[]).
shuffle([H1|T1],[H2|T2],[H1,H2|T3]) :- shuffle(T1,T2,T3).