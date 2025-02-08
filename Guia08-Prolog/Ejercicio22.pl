:- ensure_loaded('Ejercicio8.pl').      % Importamos el predicado 'borrar' para eliminar los nodos que ya se usaron en el grafo.

% Con getGrafo(conexo, G) obtenemos instanciado en G el grafo. Sirve para testear las consultas. 
% Ejemplo. La consulta 'getGrafo(conexo, G), esNodo(G, X)' instancia en G el grafo de abajo e instancia en X cada nodo.
getGrafo(conexo, grafo([1, 2, 3, 4, 5],[arista(1, 2), arista(2, 3), arista(2, 4), arista(3, 5),arista(4, 5)])).
getGrafo(disconexo, grafo([1, 2, 3, 4, 5, 6, 7],[arista(1, 2), arista(2, 3), arista(2, 4), arista(3, 5),arista(4, 5), arista(6,7)])).
getGrafo(estrella, grafo([1, 2, 3, 4, 5, 6, 7],[arista(1, 2), arista(1, 3), arista(1, 4), arista(1, 5),arista(1, 6), arista(1,7)])).

% --- Ejercicios ---

% nodos
nodosDe(grafo(V, _), V).

% aristas
aristasDe(grafo(_,E), E).

% esNodo(+G,?X)
esNodo(G, X) :- ground(G), nodosDe(G, V), member(X, V).

% esArista(+G,?X,?Y)
esArista(G, X, Y) :- ground(G), nonvar(X), nonvar(Y), aristasDe(G, E), member(arista(X,Y), E).    % Caso arista instanciada.
esArista(G, X, Y) :- ground(G), nonvar(X), nonvar(Y), aristasDe(G, E), member(arista(Y,X), E).    % Caso arista instanciada invertida.
esArista(G, X, Y) :- ground(G), nonvar(X), var(Y), aristasDe(G, E), member(arista(X,Y), E).       % Caso solo X instanciado.
esArista(G, X, Y) :- ground(G), nonvar(X), var(Y), aristasDe(G, E), member(arista(Y,X), E).       % Caso solo X instanciado invertido.
esArista(G, X, Y) :- ground(G), var(X), nonvar(Y), aristasDe(G, E), member(arista(X,Y), E).       % Caso solo Y instanciado.
esArista(G, X, Y) :- ground(G), var(X), nonvar(Y), aristasDe(G, E), member(arista(Y,X), E).       % Caso solo Y instanciado invertido.
esArista(G, X, Y) :- ground(G), var(X), var(Y), aristasDe(G, E), member(arista(X,Y), E).          % Caso ningún nodo instanciado. Se instancian todas las aristas.

% caminoSimple(+G,+D,+H,?L)
caminoSimple(_, H, H, [H]).
caminoSimple(G, D, H, [D | L]) :- esArista(G, D, N), esNodo(G, N), nodosDe(G, V), borrar(V, D, V2), aristasDe(G, E), caminoSimple(grafo(V2, E), N, H, L).

% caminoHamiltoniano(+G,?L)
caminoHamiltoniano(G, L) :- caminoSimple(G, _, _, L), length(L, N1), nodosDe(G, V), length(V, N2), N1 =:= N2. 

% esConexo(+G)
esConexo(G) :- not((esNodo(G, X), esNodo(G, Y), X \= Y, not((caminoSimple(G, X, Y, _))))). % No existen dos nodos tal que no exista camino simple entre ambos.

% esEstrella(+G)
esEstrella(G) :- esConexo(G), esNodo(G, X), not((esNodo(G, Y), X \= Y, not((esArista(G,X,Y))))). % Existe un nodo tal que no existe otro nodo que no sea arista de este.
