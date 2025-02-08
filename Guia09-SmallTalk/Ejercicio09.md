```smalltalk

generarBloqueInfinito
	^ [self generarBloqueInfinitoWithCounter: 1].

generarBloqueInfinitoWithCounter: aCounter
	| nextBlock array |

	nextBlock := [self class new generarBloqueInfinitoWithCounter: (aCounter + 1)].

	array := Array new: 2.
	array atWrap: 1 put: aCounter.
	array atWrap: 2 put: nextBlock.

	^ array.

```