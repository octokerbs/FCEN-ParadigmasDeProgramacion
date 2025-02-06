desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

% 1. +X, -Y, Porque si X no está instanciado no se puede hacer nada porque al no estar instanciado X no se puede calcular N porque X+1 está indefinido.

% 2.

% desdeReversible(+X,?Y)
desdeReversible(X,X).
desdeReversible(X,Y) :- nonvar(Y), Y >= X.
desdeReversible(X,Y) :- var(Y), N is X+1, desdeReversible(N, Y).