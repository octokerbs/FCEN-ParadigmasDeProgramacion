:- ensure_loaded('Ejercicio9.pl').

% listaQueSuma(+S, N, -XS)
listaQueSuma(0, 0, []).
listaQueSuma(S, N, [X | XS]) :- N > 0, between(0, S, X), S2 is S-X, N2 is N-1, listaQueSuma(S2, N2, XS).

% filasQueSuman(+S, +N, +XSS)
filasQueSuman(_, _, []).
filasQueSuman(S, N, [XS| XSS]) :- listaQueSuma(S, N, XS), filasQueSuman(S, N, XSS).

% cuadradoSemiMágico(+N, -XS)
cuadradoSemiMágico(N, L) :- length(L, N), desde(0, S), filasQueSuman(S, N, L).

% iesimo(?I, +L, -X)
iesimo(0, [X | _], X).
iesimo(I, [_ | XS], X) :- iesimo(I2, XS, X), I is I2 + 1.

% sumarColumna(I, XSS, S).
sumarColumna(_, [], 0).
sumarColumna(I, [XS | XSS], S) :- iesimo(I, XS, X), sumarColumna(I, XSS, S2), S is X + S2.

% columnasQueSuman(S, XSS)
columnasQueSuman(S, XSS) :- length(XSS, N), between(0, N, I), sumarColumna(I, XSS, S).

% cuadradoMagico(+N, -XS)
cuadradoMagico(N, XSS) :- cuadradoSemiMágico(N, XSS), iesimo(1, XSS, XS), sum_list(XS, S), columnasQueSuman(S, XSS).