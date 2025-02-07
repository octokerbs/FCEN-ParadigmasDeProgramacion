:- ensure_loaded('Ejercicio8.pl'). 
:- ensure_loaded('Ejercicio9.pl'). 

% generarNodos(+N, -A)
generarNodos(0, nil).
generarNodos(N, bin(AI, _, AD)) :- N > 0, K is N-1, between(0, K, NI), ND is K-NI, generarNodos(NI,AI), generarNodos(ND, AD). 

% arbol(-A)
arbol(A) :- desde(0, X), generarNodos(X, A).

% nodosEn(?A, +L)
nodosEn(nil, _).
nodosEn(bin(AI, R, AD), L) :- member(R, L), nodosEn(AI, L), nodosEn(AD, L).

% sinRepEn(-A, +L)
sinRepEn(nil, _).
sinRepEn(bin(AI, R, AD), L) :- append(L1, [R | L2], L), sinRepEn(AI, L1), sinRepEn(AD, L2).