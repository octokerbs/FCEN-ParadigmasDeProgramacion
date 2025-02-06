padre(juan, carlos).
padre(juan, luis).

padre(carlos, daniel).
padre(carlos, diego).

padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

% (1) X = Juan

% (2)

hijo(X,Y) :- padre(Y,X).

hermano(X,Y) :- padre(Z,X), padre(Z,Y), X \= Y.

descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y). % Recordar usar ';' para saltar a la siguiente instancia. Pensé que estaba mal por casi una hora solo por usar el punto en vez de punto y coma.

% (4) Habría que hacer la consulta abuelo(juan, X).
% (5) hermano(pablo, X).

ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% (7) ancestro(juan,Y). Se cuelga.
% Se instancian en X todos los ancestros de juan.
% Primera regla. Como X = juan la primera regla queda como ancestro(juan, juan).
% Segunda regla. ancestro(juan,Y). Se "consume" ancestro(Z,Y). De la primer regla se unifica X := Z y X := Y -> Y := Z.
% Luego queda padre(juan,Y) por lo que se instancian en Y todos los hijos de juan. Y := Carlos, Y := Luis.

% Luego de esto se pasa a la segunda regla nuevamente, un caso donde no sucede la unificación X := Z y X := Y. Si no que Z := X e Y := Y.
% Como Z es algún hijo de juan y X := Z entonces se empiezan a buscar a los ancestros de cada hijo de juan.

% ancestro(juan, Y) :- ancestro(Z, Y), padre(juan, Z) = padre(juan,Z) con S={X := Z, Y := Z}.
% -  padre(juan, carlos). S={Z:= carlos, Y := carlos}.
% -  padre(juan, luis). S={Z:=luis, Y := luis}.
% ancestro(juan, Y) :- ancestro(Z1, Y), padre(juan, Z1) = ancestro(Z2, Y), padre(Z1, Z2), padre(juan, Z1). S={X := Z1, Y := Y}

% Cuando se llega a padre(luis, ramiro) y se busca a los ancestros de ramiro con ancestro(ramiro, Y) llegamos, en la segunda regla, a un pozo sin salida. 
% Como no se puede instanciar padre de ramiro ni padre de ningun otro hijo de luis o carlos entonces se explora mas adentro el arbol

% (8)
ancestro2(X,X).
ancestro2(X,Y) :- padre(X,Z), ancestro2(Z,Y).