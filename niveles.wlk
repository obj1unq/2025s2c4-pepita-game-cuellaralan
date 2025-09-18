import wollok.game.*
import direcciones.*
import pepita.*
import comidas.*
import extras.*
import obstaculos.*

object nivel1 {
  method iniciar() {
    game.addVisual(silvestre)
    game.addVisual(nido)
    game.addVisual(manzana)
    game.addVisual(alpiste)
    game.addVisual(pared1)
    game.addVisual(pared2)
    game.addVisual(pepita)
    
    keyboard.up().onPressDo({ pepita.mover(arriba) })
    keyboard.down().onPressDo({ pepita.mover(abajo) })
    keyboard.left().onPressDo({ pepita.mover(izquierda) })
    keyboard.right().onPressDo({ pepita.mover(derecha) })
    //keyboard.c().onPressDo({ pepita.comerAca() })
    game.onCollideDo(pepita, {algo => pepita.colisionasteCon(algo)})
    game.onTick(8000, "pepita pierde altura", {pepita.bajarPorGravedad()})
  }
}