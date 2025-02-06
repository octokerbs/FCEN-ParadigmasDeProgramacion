vecino(X, Y, [X|[Y|_]]).
vecino(X, Y, [_|Ls]) :- vecino(X, Y, Ls).

% vecino(5, Y, [5,6,5,3])

% - vecino(5,6,[5| [6| [5,3]]]). True!
% - vecino(5, Y, [5| [6,5,3]]) :- vecino(5, Y, [6,5,3])

% -- vecino(5, Y, [5| [Y,3]). False!
% -- vecino(5, Y, [6| [5,3]]) :- vecino(5, Y, [5,3]).

% --- vecino(5, Y, [5| [3| []]]). True!
% --- vecino(5, Y, [5| [3]) :- vecino(5, Y, [3]).

% ---- vecino(5, Y, [3| [[]| []]]). False.
% ---- vecino(5, Y, [3| []) :- vecino(5, Y, []). False. (porque no matchea con ninguna definicion de vecino. Piden al menos un elemento en la lista).

vecino2(X, Y, [_|Ls]) :- vecino(X, Y, Ls).
vecino2(X, Y, [X|[Y|_]]).

% Los resultados son los mismos, solo cambia su orden de instanciacion con respecto a la variable Y.