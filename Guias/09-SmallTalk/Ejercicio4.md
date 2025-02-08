a) [:x | x + 1] value: 2
```smalltalk
 3 
```

b) [|x| x := 10. x + 12] value
```smalltalk
22
```

c) [:x :y | |z| z := x + y] value: 1 value: 2
```smalltalk
3 y una advertencia porque no usamos a z
```

d) [:x :y | x + 1] value: 1
```smalltalk
Error. El bloque acepta dos argumentos pero solo le pasamos uno.
```

e) [:x | [:y | x + 1]] value: 2
```smalltalk
Nos devuelve un closure: [:y | 2 + 1]
```

f) [[:x | x + 1]] value
```smalltalk
Nos devuelve un closure: [:x | x + 1]
```

g) [:x :y :z | x + y + z] valueWithArguments: #(1 2 3)
```smalltalk
6.
```

h) [ |z| z := 10. [:x | x + z]] value value: 10
```smalltalk
20
```

### Cuál es la diferencia entre [|x y z| x + 1] y [:x :y :z| x + 1]?
Que no se pueden instanciar valores en el primer closure. Ejecutarlo
llevará a comportamiento indefinido.