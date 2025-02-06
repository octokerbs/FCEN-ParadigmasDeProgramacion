natural(0).
natural(suc(X)) :- natural(X).

menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).

% 1. Se cuelga el programa. Como la definicion recursiva esta primero que el caso base entramos en un loop infinito para instanciar a Y.

% 2. Sucede cuando una variable unifica con su mismo representante en una nueva consulta. Unificandose con si mismo indefinidamente. Sin instanciar.

% 3.
menorOIgual2(X,X) :- natural(X).
menorOIgual2(X, suc(Y)) :- menorOIgual2(X, Y).

% Ejemplo de consulta.
% menorOIgual2(0, 0). true.
% menorOIgual2(0, suc(suc(0))). true.
% menorOIgual2(suc(0), 0). false.