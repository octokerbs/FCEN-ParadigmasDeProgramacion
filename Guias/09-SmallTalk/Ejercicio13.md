```smalltalk
aCounter := FlexibleCounter new: [:v | v+2 ]. 
aCounter nextIf: true.
```

| Objeto               | Mensaje              | Resultado            |
|----------------------|----------------------|----------------------|
| FlexibleCounter | new: |aFlexibleCounter |
| FlexibleCounter | new | aFlexibleCounter|
| FlexibleCounter | new |aFlexibleCounter |
| aFlexibleCounter | initialize: |aFlexibleCounter |
| aFlexibleCounter | useBlock: | aFlexibleCounter |
| aFlexibleCounter | nextIf: | 2 |
| true | ifTrue:ifFalse: | 2 |
| [self next] | value | 2 |
| aFlexibleCounter | next | 2 |
| [:v \| v+2 ] | value: | 2 |
| 0 | + | 2 |
| aFlexibleCounter | initialize: | aFlexibleCounter |


