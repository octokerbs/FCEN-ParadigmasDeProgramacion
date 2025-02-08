```smalltalk
(A new) a: (B new) b: (C new)
```

|Mensaje|Receptor|Colaboradores|Ubicación|Resultado|           
|-------|--------|-------------|---------|---------|
|new|A|-|Object|anA|
|new|B|-|Object|aB|
|new|C|-|Object|aC|
|a:b:|anA|aB, aC|A|3|
|c|aC|-|C| [self a: super c b: self]|
|a:b:|aB|[self a: super c b: self], anA|B|3|
|c|anA|-|A|2|
|value|[self a: super c b: self]|-|BlockClosure|1|
|c|aC|-|B|1|
|a:b:|aC|1, aC|C|1|
|+|2|1|Integer|3|
