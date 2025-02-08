% juntar(?Lista1,?Lista2,?Lista3)

juntar([], YS, YS).
juntar([X| XS], YS, [X| ZS]) :- juntar(XS, YS, ZS).