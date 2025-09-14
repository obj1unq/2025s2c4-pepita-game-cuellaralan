import extras.*
import wollok.game.*

object pepita {
	var energia = 100
	const cazador = silvestre	
	const hogar = nido
	//al agregar visual necesita entender el mensaje position()
	var property position = game.at(0, 1)
	//para mostrar al personaje debe entender mensaje image
	method image() = "pepita-" + self.estado() + ".png"
	method estado() {
	  return if(self.esAtrapada()){"gris"}
	  else if(self.alncanzoNido()) {"grande"}
	  else {"normal"}
	}

	method esAtrapada() = position == cazador.position()
	method alncanzoNido() = position == hogar.position()
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}	

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

}

