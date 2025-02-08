% aplanar(+Xs, -Ys)

aplanar([], []).
aplanar([XS| XSS], YS) :- aplanar(XS, ZS), aplanar(XSS, RS), append(ZS, RS, YS).
aplanar([X| XS], [X| YS]) :- not(aplanar(X,_)), aplanar(XS,YS).      