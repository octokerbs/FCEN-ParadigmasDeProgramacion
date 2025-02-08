% inorder(+AB,-Lista)
inorder(nil, []).
inorder(bin(Izq, R, Der), L) :- inorder(Izq, L1), inorder(Der, L2), append(L1, [R | L2], L).

%% Se puede probar con inorder(bin(bin(bin(nil,4,nil),2,bin(bin(nil,6,nil),5,bin(nil,7,nil))), 1, bin(nil,3,bin(bin(nil,9,nil),8,nil))),[4,2,6,5,7,1,3,9,8]).
%% Y con inorder(bin(bin(bin(nil,4,nil),2,bin(bin(nil,6,nil),5,bin(nil,7,nil))), 1, bin(nil,3,bin(bin(nil,9,nil),8,nil))), L).

% arbolConInorder(+Lista,-AB)
arbolConInorder([], nil).
arbolConInorder(L, bin(Izq, R, Der)) :-  append(L1, [R | L2], L), arbolConInorder(L1, Izq), arbolConInorder(L2, Der).

% aBB(+T)
aBB(nil).
aBB(bin(Izq, R, Der)) :- aBB(Izq), aBB(Der), inorder(Izq, L1), inorder(Der, L2), max_list(L1, R), min_list(L2, R).

% aBBInsertar(+X, +T1, -T2)
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(Izq, R, Der), bin(T, R, Der)) :- X < R, aBBInsertar(X, Izq, T).
aBBInsertar(X, bin(Izq, R, Der), bin(Izq, R, T)) :- R < X, aBBInsertar(X, Der, T).