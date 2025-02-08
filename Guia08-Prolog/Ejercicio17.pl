% P(?X) 

% Q(?X)

% ?- P(Y), not(Q(Y))

% 1. Significa que queremos un Y tal que P la instancie pero Q no pueda instanciarla.

% 2. Si se invierte el orden prolog va a buscar la NO instanciacion de Y con respecto a Q. Esto solo es verdadero si no existe base de conocimientos de Q. Pero 
% si la base de conocimiento no existe entonces prolog falla porque no se pudo instanciar a Y. EL NOT NO SIRVE PARA INSTANCIAR.

% 3. P(Y), not((P(X), X \= Y))