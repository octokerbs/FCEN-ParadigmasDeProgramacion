:- ensure_loaded('Ejercicio9.pl').

% divisores(N1, N2, L)
divisores(X, N2, [X | XS]) :- X =< N2, mod(N2,X) =:= 0, N3 is X + 1, divisores(N3, N2, XS).
divisores(N1, N2, XS) :- N1 =< N2, mod(N2,N1) =\= 0, N3 is N1 + 1, divisores(N3, N2, XS).
divisores(N, N, [N]).

% esPrimo(N).
esPrimo(N) :- divisores(1, N, L), length(L, X), X =:= 2, !. % Los numeros primos solo tienen 2 divisores. 1 y si mismos.

% próximoNumPoderoso(+X,-)
proximoNumPoderoso(X,M) :- X2 is X + 1, desdeReversible(X2, M), divisores(1, M, D), not((member(P, D), esPrimo(P), not((0 is mod(M, P), 0 is mod(M, P*P))))), !.

% Para algun M mayor a X existe una lista de divisores D tal que ninguno de sus primos no divida a M y su cuadrado tampoco.