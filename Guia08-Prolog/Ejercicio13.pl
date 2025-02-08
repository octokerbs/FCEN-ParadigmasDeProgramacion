:- ensure_loaded('Ejercicio9.pl').

% generate(X, Y)
generate(X, Y) :- desde(0, Z), between(0, Z, X), Y is Z-X.

% coprimos(X,Y)
coprimos(X, Y) :- generate(X, Y), gcd(X,Y) =:= 1.