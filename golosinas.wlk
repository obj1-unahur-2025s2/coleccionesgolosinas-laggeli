class Bombon {
    var property peso = 15
    method precio() = 5
    method sabor() = frutilla.nombre()
    method contieneGluten() = false
    method recibirMordisco() {
        peso = ((peso * 0.8) - 1).max(0)
    }
}

class Alfajor {
    var property peso = 300
    method precio() = 12
    method sabor() = chocolate.nombre()
    method contieneGluten() = true
    method recibirMordisco() {
        peso = (peso * 0.8).max(0)
    }
}

class Caramelo {
    var property peso = 5
    method precio() = 1
    method sabor() = frutilla.nombre()
    method contieneGluten() = false
    method recibirMordisco() {
        peso = (peso - 1).max(0)
    }
}

class Chupetin {
    var property peso = 7
    method precio() = 2
    method sabor() = naranja.nombre()
    method contieneGluten() = false
    method recibirMordisco() {
        if (peso > 2) { peso = peso * 0.9} 
    }
}

class Oblea {
    var property peso = 250
    method precio() = 5
    method sabor() = vainilla.nombre()
    method contieneGluten() = true
    method recibirMordisco() {
        if (peso > 70) { peso = peso * 0.5 }
        else { peso = (peso * 0.25).max(0) }
    }
}

class Chocolatin {
    const pesoInicial
    var property peso = pesoInicial 
    method precio() = 0.50 * pesoInicial
    method sabor() = chocolate.nombre()
    method contieneGluten() = true
    method recibirMordisco() { peso = (peso - 2).max(0) }
}

class GolosinaBañada {
    const property golosinaBase
    var property pesoDelBañado = 4
    var property peso = golosinaBase.peso() + pesoDelBañado
    method precio() = golosinaBase.precio() + 2
    method sabor() = golosinaBase.sabor()
    method contieneGluten() = golosinaBase.contieneGluten()
    method recibirMordisco() {
        golosinaBase.recibirMordisco()
        pesoDelBañado = (pesoDelBañado - 2).max(0)
    }
}

class PastillaTuttiFrutti {
    var property peso = 5
    var saborActual = frutilla
    const property contieneGluten
    method sabor() = saborActual.nombre()
    method precio() = if (contieneGluten) 10 else 7
    method recibirMordisco() {
        saborActual = saborActual.siguiente()
    }
}

object frutilla {
    method siguiente() = chocolate
    method nombre() = "Frutilla"
}

object chocolate {
    method siguiente() = naranja
    method nombre() = "Chocolate"
}

object naranja {
    method siguiente() = frutilla
    method nombre() = "Naranja"
}

object vainilla {
    method nombre() = "Vainilla"
}
