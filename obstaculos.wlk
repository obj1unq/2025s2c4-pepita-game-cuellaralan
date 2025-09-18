import wollok.game.*

object pared1 {
    var property position = game.at(2, 0)
    method image() = "muro.png"

    method queHagoConVos(alguien) {
	  alguien.volver()
	}
  
}
object pared2 {
    var property position = game.at(2, 4)
    method image() = "muro.png"
    method queHagoConVos(alguien) {
	  alguien.volver()
	}
}