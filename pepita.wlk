
object pepita {
	var energia = 100
	//al agregar visual necesita entender el mensaje position()
	var property position = game.at(0, 1)
	//para mostrar al personaje debe entender mensaje image
	method image() = "pepita-normal.png"
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

