:- ensure_loaded('Ejercicio9.pl').

p(X) :- mod(X,2) =:= 0.

minimoNatural(X) :- desdeReversible(1, X), p(X), not((between(1,X,Y), p(Y), Y < X)),!.