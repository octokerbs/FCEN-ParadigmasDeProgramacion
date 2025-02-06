% borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([], _, []).
borrar([X | XS], X, L) :- borrar(XS, X, L), !.
borrar([Y | XS], X, [Y | L]) :- X \= Y, borrar(XS, X, L).

% parteQueSuma(+L,+S,-P)
parteQueSuma(_, 0, []).
parteQueSuma(L1, S, [X | P]) :- S > 0, member(X, L1), borrar(L1, X, L2), N is S - X, parteQueSuma(L2, N, P). 