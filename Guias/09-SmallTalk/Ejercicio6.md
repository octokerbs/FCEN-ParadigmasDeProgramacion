a) #collect:

Es como un map. A cada elemento le aplica el closure.
```smalltalk
| x | 
x := OrderedCollection new add:1;add:2;add:3;add:4;yourself. 
x collect: [ :aNumber | aNumber * 2 ]. 

an OrderedCollection(2 4 6 8) .
```

b) #select:

Es como un filter. Selecciona los elementos que hacen verdadera a la funcion.
```smalltalk
| x | 
x := OrderedCollection new add:1;add:2;add:3;add:4;yourself. 
x select: [ :aNumber | aNumber even ].  

an OrderedCollection(2 4) .
```

c) #inject: into:

Pone al 0 como elemento acumulador y acumula sobre este con cada elmento.
```smalltalk
| x | 
x := OrderedCollection new add:1;add:2;add:3;add:4;yourself. 
x inject: 0 into: [:a :c | a + c]. 

10 .
```

d) #reduce: (o #fold:)

```smalltalk
| x | 
x := OrderedCollection new add:'1';add:'2';add:'3';add:'4';yourself. 
x reduce: [ :a :b | b,a ].   

'4321' .
```

e) #reduceRight:
```smalltalk
Estoy usando CuisUniversity (la implementación de smalltalk que se usa en inge1) y no existe este método :(
```

f) #do:
```smalltalk
| x y | 
x := OrderedCollection new add:1;add:2;add:3;add:4;yourself. 
y := OrderedCollection new.
x do: [ :aNumber| y add: aNumber*2].
y. 

an OrderedCollection(2 4 6 8) .
```
