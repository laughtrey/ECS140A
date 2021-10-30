/* ECS 140A Assignment 4 Summer 2021 */
/* Sudoku Solver */

/* For this assignment you will need to implement your 
own 9x9 Sudoku solver in SWI-Prolog.  Basically you 
have a 9x9 grid, and you must fill in the 
grid so that each row, each column, and each of 9 3x3 
grids all contain the numbers 1 through 9. */

/* You will need to fill in the sudoku predicate below, 
and also supply any helper predicates. You should think 
about what has to be true to make a sudoku table valid 
and work out how to check for each of these conditions. */

/* To test your program we will type "test." into 
SWI-Prolog and study the results. */

/* When grading we will be looking for solutions that 
work correctly and run in less than a minute, 
but we also want to see clearly commented 
code explaining what each predicate is doing. If 
your code does not work but appears to be close to a 
working solution or your comments are along the correct 
lines, then you will receive some credit. If your code is not 
clearly commented showing an understanding of what is 
happening then you will receive considerably fewer points
than you might have otherwise. */

% WHAT YOU NEED TO HAND IN
/* You should use Canvas to submit a plain text file
named 'sudoku.pl' that contains your sudoku predicate and 
any helper predicates. We should be able to run this by 
using the tests provided. The file should contain your 
name and student number. */

/* Keep in mind that you may not use the Constraint
Logic Programming features supplied by SWI-Prolog. */


/* ----------- cut here ----------- */

/* include name and student number */

/* This runs all the simple tests. If it 
works correctly, you should see three identical 
and completed sudoku tables, and finally the 
word false (as test0c will fail.) */
test :-
	test0, nl,
	test0a, nl,
	test0b, nl,
	test0c.

/* This is a completly solved solution. */
test0 :-
	L = [
             [9,6,3,1,7,4,2,5,8],
             [1,7,8,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,9,6],
             [4,9,6,8,5,2,3,1,7],
             [7,3,5,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) which 
should be found very quickly. */
test0a :-
	L = [
             [9,_,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) and 
may take a few seconds to find. */
test0b :-
	L = [
             [9,_,3,1,7,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This one obviously has no solution (column 2 has 
two nines in it.) and it may take a few seconds 
to deduce this. */
test0c :-
	L = [
             [_,9,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).


% print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).


% Expects a list of lists 9 by 9 grid.
sudoku(L) :- 
        L = [[A1,A2,A3,A4,A5,A6,A7,A8,A9],
        [B1,B2,B3,B4,B5,B6,B7,B8,B9],
        [C1,C2,C3,C4,C5,C6,C7,C8,C9],
        [D1,D2,D3,D4,D5,D6,D7,D8,D9],
        [E1,E2,E3,E4,E5,E6,E7,E8,E9],
        [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        [G1,G2,G3,G4,G5,G6,G7,G8,G9],
        [H1,H2,H3,H4,H5,H6,H7,H8,H9],
        [I1,I2,I3,I4,I5,I6,I7,I8,I9]],
% Arrange each row into it's own variable.
        Row1 = [A1,A2,A3,A4,A5,A6,A7,A8,A9],
        Row2 = [B1,B2,B3,B4,B5,B6,B7,B8,B9],
        Row3 = [C1,C2,C3,C4,C5,C6,C7,C8,C9],
        Row4 = [D1,D2,D3,D4,D5,D6,D7,D8,D9],
        Row5 = [E1,E2,E3,E4,E5,E6,E7,E8,E9],
        Row6 = [F1,F2,F3,F4,F5,F6,F7,F8,F9],
        Row7 = [G1,G2,G3,G4,G5,G6,G7,G8,G9],
        Row8 = [H1,H2,H3,H4,H5,H6,H7,H8,H9],
        Row9 = [I1,I2,I3,I4,I5,I6,I7,I8,I9],
% Arrange each column into it's own variable.
        Column1 = [A1,B1,C1,D1,E1,F1,G1,H1,I1],
        Column2 = [A2,B2,C2,D2,E2,F2,G2,H2,I2],
        Column3 = [A3,B3,C3,D3,E3,F3,G3,H3,I3],
        Column4 = [A4,B4,C4,D4,E4,F4,G4,H4,I4],
        Column5 = [A5,B5,C5,D5,E5,F5,G5,H5,I5],
        Column6 = [A6,B6,C6,D6,E6,F6,G6,H6,I6],
        Column7 = [A7,B7,C7,D7,E7,F7,G7,H7,I7],
        Column8 = [A8,B8,C8,D8,E8,F8,G8,H8,I8],
        Column9 = [A9,B9,C9,D9,E9,F9,G9,H9,I9],
% Arrange each 3x3 square into it's on square
        Square1 = [A1,A2,A3,B1,B2,B3,C1,C2,C3],
        Square2 = [A4,A5,A6,B4,B5,B6,C4,C5,C6],
        Square3 = [A7,A8,A9,B7,B8,B9,C7,C8,C9],
        Square4 = [D1,D2,D3,E1,E2,E3,F1,F2,F3],
        Square5 = [D4,D5,D6,E4,E5,E6,F4,F5,F6],
        Square6 = [D7,D8,D9,E7,E8,E9,F7,F8,F9],
        Square7 = [G1,G2,G3,H1,H2,H3,I1,I2,I3],
        Square8 = [G4,G5,G6,H4,H5,H6,I4,I5,I6],
        Square9 = [G7,G8,G9,H7,H8,H9,I7,I8,I9],
% Check if each direction and each square is worthy!
        worthy(Row1),
        worthy(Row2),
        worthy(Row3),
        worthy(Row4),
        worthy(Row5),
        worthy(Row6),
        worthy(Row7),
        worthy(Row8),
        worthy(Row9),

        worthy(Column1),
        worthy(Column2),
        worthy(Column3),
        worthy(Column4),
        worthy(Column5),
        worthy(Column6),
        worthy(Column7),
        worthy(Column8),
        worthy(Column9),

        worthy(Square1),
        worthy(Square2),
        worthy(Square3),
        worthy(Square4),
        worthy(Square5),
        worthy(Square6),
        worthy(Square7),
        worthy(Square8),
        worthy(Square9).


% YOU NEED TO COMPLETE THIS PREDICATE, PLUS PROVIDE ANY HELPER PREDICATES BELOW.

% Check if each list is worthy.
worthy(L) :- valid(L),diff(L).
% Check if each list is between 1-9.
valid([H]) :- validval(H).
valid([H|T]) :-validval(H),valid(T).
% Statements.
validval(1).
validval(2).
validval(3).
validval(4).
validval(5).
validval(6).
validval(7).
validval(8).
validval(9).
% Checks to make sure each elem is unique.
diff([H]).
diff([H|T]) :- not(member(H,T)),diff(T).
% Member predicate.
member(H,[H|T]).
member(X,[H|T]) :- member(X,T).
