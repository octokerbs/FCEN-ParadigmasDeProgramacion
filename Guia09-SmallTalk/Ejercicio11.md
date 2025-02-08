1. anObject
2. anObject
3. Si. Super es igual a self. La diferencia es como buscan los métodos. `self` busca el método en la clase del objeto receptor y, si no lo encuentra, continúa la búsqueda en la cadena de superclases. `super` busca el método directamente en la superclase de la clase donde se encuentra el método actual, ignorando la clase del receptor.