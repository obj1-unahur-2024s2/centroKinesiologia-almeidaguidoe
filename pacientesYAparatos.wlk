class Paciente {
  const property edad
  var property fortalezaMuscular
  var property nivelDeDolor
  method usar(aparato) {
    if (self.puedeUsarAparato(aparato)) {
      aparato.consecuenciasDeUso(self)
    }
  }

  method disminuirDolor(unValor) {nivelDeDolor -= unValor}

  method aumentarFortalezaMuscular(unValor) {fortalezaMuscular += unValor}

  method puedeUsarAparato(unAparato) = unAparato.puedeSerUsado(self)
}

class Aparato {
  method consecuenciasDeUso(unPaciente)
  method puedeSerUsado(unPaciente)
}

class Magneto inherits Aparato {
  override method consecuenciasDeUso(unPaciente) {
    unPaciente.disminuirDolor(unPaciente.nivelDeDolor()*0.1)
  }
  override method puedeSerUsado(unPaciente) = true
}

class Bicicleta inherits Aparato {
  override method consecuenciasDeUso(unPaciente) {
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortalezaMuscular(3)
  }

  override method puedeSerUsado(unPaciente) = unPaciente.edad() > 8
}

class Minitramp inherits Aparato {
  override method consecuenciasDeUso(unPaciente) {
    unPaciente.aumentarFortalezaMuscular(unPaciente.edad()*0.1)
  }

  override method puedeSerUsado(unPaciente) = unPaciente.nivelDeDolor() < 20
}