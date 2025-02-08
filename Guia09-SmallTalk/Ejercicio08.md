1. 
```smalltalk
curry

^ [:x | [:y | self value: x value: y]].
```

2. 
```smalltalk
flip

^ [:x :y | self value: y value: x].
```

3. 
```smalltalk
timesRepeat: aBlock 
        | count | 
        count := 1. 
        [count <= self] whileTrue: [aBlock value. count := count + 1]
```