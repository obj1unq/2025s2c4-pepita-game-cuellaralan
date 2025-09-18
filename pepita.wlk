import direcciones.*
import extras.*
import wollok.game.*
import niveles.*


object pepita {
	var energia = 100
	var energiaAnterior = 100
	const costePorKm = 9
	const cazador = silvestre	
	const hogar = nido
	var posiconAnterior = game.at(0,1)
	const energiaInicial = 100
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
		energia += comida.energiaQueOtorga()
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
			posiconAnterior = position
			energiaAnterior = energia
			position = direccion.siguiente(position)
			//game.say(self, "me estoy moviendo " )
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

	method comerAca(comida) {
			self.comer(comida)
			comida.desaparecer()	
	}

	method bajarPorGravedad() {
		if(self.puedeDescender())
		{
	  		position = abajo.siguiente(position)
		}
	}

	method puedeDescender() = position.y() > 0 && !self.alncanzoNido() && self.energiaSuficiente()

	method colisionasteCon(algo) {
		algo.queHagoConVos(self)
	}

	method volver() {
	  position = posiconAnterior
	  energia = energiaAnterior
	}

	method perdiste(){
		game.say(self, "Perdiste, presiona la R para reiniciar")
		keyboard.r().onPressDo {
			game.clear()
			nivel1.iniciar()
			self.inicializar()
		}
	}	

	method ganar() {
	  game.say(self, "Ganaste, presiona la R para reiniciar")
	  game.removeTickEvent("pepita pierde altura")
	  console.println("ganaste")
	  keyboard.r().onPressDo {self.inicializar()}
	}

	method inicializar() {
		game.clear()
		position = game.at(0,1)
		energia = energiaInicial
		nivel1.iniciar()
		//atrapada = false
	}

}

