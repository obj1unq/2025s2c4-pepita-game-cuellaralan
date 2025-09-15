import direcciones.*
import extras.*
import wollok.game.*

object pepita {
	var energia = 1000
	const costePorKm = 9
	const cazador = silvestre	
	const hogar = nido
	//al agregar visual necesita entender el mensaje position()
	var property position = game.at(0, 1)
	//para mostrar al personaje debe entender mensaje image
	method image() = "pepita-" + self.estado() + ".png"
	
	method estado() {
	  return if(!self.puedeVolar()&& !self.alncanzoNido()){"gris"}
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
		if(self.puedeVolar() && !self.alncanzoNido() && self.dentroDelTablero(direccion)){
			position = direccion.siguiente(position)
			self.volar(1)
		}
	}

	method puedeVolar() = self.energiaSuficiente() && !self.esAtrapada() 

	method energiaSuficiente() = energia > 0

	method dentroDelTablero(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		return (siguientePosicion.y() >= 0 && siguientePosicion.y() <= game.height()-1)&&
		(siguientePosicion.x() >= 0 && siguientePosicion.x() <= game.width()-1) 
		
	}
	method alimentoQueEstaEnSuPosicion() = game.uniqueCollider(self)

	method comerAca() {
		const comida = self.alimentoQueEstaEnSuPosicion()
		if(comida != null) {
			self.comer(comida)
			comida.desaparecer()
		}	
	}

	method bajarPorGravedad() {
		if(self.puedeDescender())
		{
	  		position = abajo.siguiente(position)
		}
	}

	method puedeDescender() = position.y() > 0 && !self.alncanzoNido() && self.energiaSuficiente()

}

