% natural(N).
natural(cero).
natural(suc(X)) :- natural(X).

% pertenece(?Elemento, +Conjunto)
pertenece(X, [X | _]).
pertenece(Y, [X | XS]) :- Y =\= X, pertenece(Y, XS).

% conjuntoDeNaturales(X)        
conjuntoDeNaturales(X) :- not( (pertenece(N,X), not( natural(N) )) ).

% No uses numeros. Ejemplo: conjuntoDeNaturales([suc(cero),suc(suc(cero)),suc(suc(suc(cero)))]).