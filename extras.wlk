import pepita.*
import wollok.game.*

object silvestre {
  const presa = pepita
  //var property position = game.at(self.minX(), 0)

    method image()= "silvestre.png"
    //no es property porque reacciona con el movimiento de pepita
    method position() = game.at(self.minX(), 0)
    //devuelve posición mínima de silvestre con respecto
    //a su presa
    method minX() {
        if(presa.position().x() >= 3)
        {
            return presa.position().x()
        }else{return 3}
    }
}

object nido {
  method image() = "nido.png"
  var property position = game.at(8, 8)
}

