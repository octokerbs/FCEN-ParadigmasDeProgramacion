% last(?L, ?U)
last(L, U) :- append(_, [U], L).

% reverse(+L, ?R)
reverse([], []).
reverse([X| XS], R) :- reverse(XS, YS), append(YS, [X], R).

% prefijo(?P, +L)
prefijo(P, L) :- append(P, _, L).

% sufijo(?S, +L)
sufijo(S, L) :- append(_, S, L).

% sublista(?S, +L)
sublista([], _).
sublista(S, L) :- prefijo(P, L), sufijo(S, P), S \= [].

% pertenece(?X, +L)
pertenece(X, [X| _]).
pertenece(X, [_| XS]) :- pertenece(X, XS).