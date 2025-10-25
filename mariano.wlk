object mariano {
    const bolsaDeGolosinas = []
    const bolsaDeGolosinasDesechadas = []
    method comprar(golosina) { 
        bolsaDeGolosinas.add(golosina)
    }
    method desechar(golosina) { 
        bolsaDeGolosinas.remove(golosina)
        bolsaDeGolosinasDesechadas.add(golosina)
    }
    method cantidadDeGolosinas() = bolsaDeGolosinas.size()
    method tieneLaGolosina(golosina) = bolsaDeGolosinas.contains(golosina)
    method probarGolosinas() { bolsaDeGolosinas.forEach({g => g.recibirMordisco()}) }
    method hayGolosinaSinTACC() = bolsaDeGolosinas.any({g => !g.contieneGluten()})
    method preciosCuidados() = bolsaDeGolosinas.all({g => g.precio() < 11})
    method golosinaDeSabor(sabor) = bolsaDeGolosinas.find({g => g.sabor() == sabor}) 
    method golosinasDeSabor(sabor) = bolsaDeGolosinas.filter({g => g.sabor() == sabor}) 
    method sabores() = bolsaDeGolosinas.map({g => g.sabor()}).asSet()
    method golosinaMasCara() = bolsaDeGolosinas.max({g => g.precio()})
    method pesoGolosinas() = bolsaDeGolosinas.sum({g => g.peso()})
    method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.filter({ g => !self.tieneLaGolosina(g) })
    method gustosFaltantes(gustosDeseados) = gustosDeseados.difference(self.sabores())
    method gastoEn(sabor) = self.golosinasDeSabor(sabor).sum({g => g.precio()})
    method saborMasPopular() = self.sabores().max({ s => bolsaDeGolosinas.count({ g => g.sabor() == s })})
    method saborMasPesado() = self.sabores().max({ s => bolsaDeGolosinas.filter({ g => g.sabor() == s }).sum({ g => g.peso() })})
    method compróYDesechó(golosina) = bolsaDeGolosinasDesechadas.contains(golosina)
}