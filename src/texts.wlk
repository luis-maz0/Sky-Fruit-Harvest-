import wollok.game.*

class Text{
	var property textColor = 'FFFFFFFFF'
	method position() = game.at(4,7)
	method textColor() = textColor
	method text()
}
class MenuText inherits Text{
	override method text() = "SKY FRUIT HARVEST\n\n\n PRESS ENTER"
}
class GameOverText inherits Text{
	var property character
	override method text() = "GAME OVER.\nYour score was: "+ character.score().toString() + "\nRestart(R)\nExit(E)"
}
class ScoreText inherits GameOverText{
	override method position() = game.at(4,12)
	override method text() = character.score().toString()
}
