% This program solves the towers of hanoi problem, using any number of disks and three pegs: Source, Target and Auxiliary.
%Base case, move one disk from the source to the target peg. 
move(1, X, Y, _) :-
    write(X),
    write(' -> '),
    write(Y),
    nl.

%Classic algorithm by recursion, N = number of disks, X = Source, Y = Target, Z = Auxiliary
move(N, X, Y, Z) :- 
    N>1, % If n is more than 1, to filter 0 and negative values
    M is N-1, 
    move(M, X, Z, Y), % Move N-1 disks from the source to the auxiliary, using the target peg
    move(1, X, Y, _), % Move a disk from the source to the target
    move(M, Z, Y, X). % Move N-1 disks from the auxiliary to the target, using the source peg

% Assuming we call source, auxiliary and target right, center and left respectively, we can create a predicate that 
% only takes the number of disks on the source:
hanoi(N):-
    move(N, 'Right', 'Left', 'Center').

% To use the program, we input the number of disks on the hanoi() predicate
% Ex. for 4 disks, call hanoi(4)