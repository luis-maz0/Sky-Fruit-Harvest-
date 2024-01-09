import wollok.game.*

class Text{
	var property character
	var property textColor = 'FFFFFFFFF'
	method position() = game.at(4,7)
	method textColor() = textColor
	method text()
}
class GameOverText inherits Text{
	override method text() = "GAME OVER.\nYour score was: "+ character.score().toString() + "\nRestart(R)\nExit(E)"
}
class ScoreText inherits Text{
	override method position() = game.at(4,12)
	override method text() = character.score().toString()
}