same_elements(L1, L2) :- maplist(same_element(L2), L1).
same_element(L, X) :- member(X, L).