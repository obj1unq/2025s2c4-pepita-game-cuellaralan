import wollok.game.*

object manzana {
	const base= 15
	var madurez = 1
	var property position = game.at(2, 3)
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}
	method image() = "manzana.png"
	method desaparecer(){
		game.removeVisual(self)
	}
}

object alpiste {
	var property position = game.at(5, 5)
	method energiaQueOtorga() {
		return 20
	} 
	method image() = "alpiste.png"
	method desaparecer(){
		game.removeVisual(self)
	}
}

