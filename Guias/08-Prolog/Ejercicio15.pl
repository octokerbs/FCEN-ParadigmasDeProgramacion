:- ensure_loaded('Ejercicio9.pl').

% esTriángulo(+T)
esTriangulo(tri(A, B, C)) :- A < B+C, B < C+A, C < A+B.

% perímetro(?T,?P)
perimetro(tri(A,B,C),P) :- ground(tri(A,B,C)), esTriangulo(tri(A,B,C)), P is A+B+C.
perimetro(tri(A,B,C),P) :- not(ground(tri(A,B,C))), armarTriplas(P,A,B,C), esTriangulo(tri(A,B,C)).

armarTriplas(P,A,B,C) :- desdeReversible(3,P), between(0,P,A), S is P-A, between(0,S,B), C is S-B.

triangulos(T) :- perimetro(T,_).