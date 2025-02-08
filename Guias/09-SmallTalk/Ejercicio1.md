a) 10 numberOfDigitsInBase: 2.

1. Mensajes: {numberOfDigitsInBase:}
2. Receptores: {10}
3. Colaboradores: {2}

b) 10 factorial.

1. Mensajes: {factorial}
2. Receptores: {10}
3. Colaboradores: {}

c) 20 + 3 * 5.

1. Mensajes: {+, *}
2. Receptores: {20, 23}
3. Colaboradores: {3, 5}

d) 20 + (3 * 5).

1. Mensajes: {+, *}
2. Receptores: {20, 3}
3. Colaboradores: {}

e) December first, 1985.

1. Mensajes: {first, ','}
2. Receptores: {December, December first}
3. Colaboradores: {1985}

f) 1 = 2 ifTrue: [ `what!?' ].

1. Mensajes: {=, ifTrue}
2. Receptores: {1, False}
3. Colaboradores: {2, [`what!?']}

g) 1@1 insideTriangle: 0@0 with: 2@0 with: 0@2.

1. Mensajes: {insideTriangle:with:with:, @, @, @, @}
2. Receptores: {1, 0, 2, 0}
3. Colaboradores: {1, 0, 0, 2, 0@0, 2@0, 0@2}

h) `Hello World' indexOf: $o startingAt: 6.

1. Mensajes: {indexOf:startingAt:}
2. Receptores: {`Hello World'}
3. Colaboradores: {$o, 6}

i) (OrderedCollection with: 1) add: 25; add: 35; yourself.

1. Mensajes: {with:, add:, add:, yourself}
2. Receptores: {OrderedCollection, (OrderedCollection with: 1), (OrderedCollection with: 1), (OrderedCollection with: 1)}
3. Colaboradores: {1, 25, 35}

j) Object subclass: #SnakesAndLadders
instanceVariableNames: `players squares turn die over'
classVariableNames: `'
poolDictionaries: `'
category: `SnakesAndLadders'

1. Mensajes: {subclass:instanceVariableNames:classVariableNames:poolDictionaries:category:}
2. Receptores: {Object}
3. Colaboradores: {#SnakesAndLadders, `players squares turn die over', '', '', `SnakesAndLadders'}
.