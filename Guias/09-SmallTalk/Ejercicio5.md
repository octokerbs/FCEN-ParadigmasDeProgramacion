a) factorialsList: 10.
```smalltalk
Nothing more expected ->factorialsList: 10.
```
b) Integer factorialsList: 10.
```smalltalk
Message Not Understood. No existe la keyword "factorialsList:"
```
c) 3 factorialsList.
```smalltalk
 an OrderedCollection(1 2 6) .
```
d) 5 factorialsList at: 4.
```smalltalk
 24 .
```
e) 5 factorialsList at: 6.
```smalltalk
Attempt to index non-existent element in an ordered collection
```
