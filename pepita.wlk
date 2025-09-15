import extras.*
import wollok.game.*

object pepita {
	var energia = 100
	const costePorKm = 9
	const cazador = silvestre	
	const hogar = nido
	//al agregar visual necesita entender el mensaje position()
	var property position = game.at(0, 1)
	//para mostrar al personaje debe entender mensaje image
	method image() = "pepita-" + self.estado() + ".png"
	method estado() {
	  return if(!self.puedeVolar()){"gris"}
	  else if(self.alncanzoNido()) {"grande"}
	  else {"normal"}
	}

	method esAtrapada() = position == cazador.position()
	method alncanzoNido() = position == hogar.position()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}	
	//texto que se muestra en la pantalla de juego para mostrar la vida
	method text() = "Energia: \n" + energia
	method textColor() = "ff7c00"
	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}
	
	method energiaNecesaria(kms) = kms * costePorKm

	method energia() {
		return energia
	}

	method mover(direccion) {
		if(self.puedeVolar() && !self.alncanzoNido()){
			position = direccion.siguiente(position)
			self.volar(1)
		}
	}

	method puedeVolar() = self.energiaSuficiente() && !self.esAtrapada() 

	method energiaSuficiente() = energia > 0
}

