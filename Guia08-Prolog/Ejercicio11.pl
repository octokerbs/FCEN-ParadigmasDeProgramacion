% vacio(A)
vacio(nil).

% raiz(A, V)
raiz(bin(_, V, _), V).

% altura(A, N)
altura(nil, 0).
altura(bin(Izq, _, Der), N) :- altura(Izq, N1), altura(Der, N2), N is 1 + max(N1, N2).

% cantidadDeNodos(A, N)
cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(Izq, _, Der), N) :- cantidadDeNodos(Izq, N1), cantidadDeNodos(Der, N2), N is 1 + N1 + N2.