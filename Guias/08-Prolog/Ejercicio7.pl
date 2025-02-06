% intersección(+L1, +L2, -L3)
intersección([], _, []).
intersección([X| XS], L2, L3) :- not( member(X, L2) ), intersección(XS, L2, L3).
intersección([X| XS], L2, [X| L3]) :- member(X, L2), intersección(XS, L2, L3).

% partir(N, L, L1, L2) - Todos. Prolog va a instanciar la N y L para devolvernos L1 y L2.
partir(0, L, [], L).
partir(N, [X| XS], [X | L1], L2) :- N2 is N-1, partir(N2, XS, L1, L2).

% borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([], _, []).
borrar([X | XS], X, L) :- borrar(XS, X, L).
borrar([Y | XS], X, [Y | L]) :- X \= Y, borrar(XS, X, L).

% sacarDuplicados(+L1, -L2)
sacarDuplicados([], []).
sacarDuplicados([X | L1], [X | L2]) :- borrar(L1, X, L3), sacarDuplicados(L3, L2).    

%count2(X, L1, N).
count2(_, [], 0).
count2(X, [X | XS], N) :- count2(X, XS, N2), N is N2+1.
count2(X, [Y | XS], N) :- X \= Y, count2(X, XS, N).

% permutacionutación(+L1, ?L2)
takeout(X,[X | XS],XS).  
takeout(X,[Y | YS],[Y | S]) :- takeout(X, YS, S).

permutacion([X | XS],L) :- permutacion(XS, Y), takeout(X, L, Y).  
permutacion([],[]).

% reparto(+L, +N, -LListas)
reparto([], 0, []).
reparto(L, N, [X | LListas]) :- N > 0, append(X, XS, L), N2 is N-1, reparto(XS, N2, LListas).

% repartoSinVacías(+L, -LListas)
repartoSinVacías(L, LListas) :- length(L, N), between(1, N, K), reparto(L, K, LListas), not(member([], LListas)).