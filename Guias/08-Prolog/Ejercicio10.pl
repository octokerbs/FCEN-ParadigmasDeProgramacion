% intercalar(L1, L2, L3)
intercalar([], L2, L2).
intercalar(L1, [], L1).
intercalar([X | XS], [Y | YS], [X | [Y | ZS]]) :- intercalar(XS, YS, ZS).