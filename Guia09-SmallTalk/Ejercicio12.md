```smalltalk
Figura subclass: Cuadrado [
    | lado |

    Cuadrado class >> nuevoConLado: unLado [
        ^self new
            lado: unLado.
    ]

    lado: unLado [
        lado := unLado.
    ]

    lados [
        ^Bag with: lado with: lado with: lado with: lado.
    ]

    // El cuadrado puede usar el metodo 'perimetro' de 'Figura'.
]

Figura subclass: Círculo [
    | radio |

    Círculo class >> nuevoConRadio: unRadio [
        ^self new
            radio: unRadio.
    ]

    radio: unRadio [
        radio := unRadio.
    ]

    lados [
        ^Bag new.
    ]

    perimetro [
        ^2 * 3.14 * radio.
    ]
]
```