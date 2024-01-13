import wollok.game.*
import configuration.*

class FallingObject {
	var property eventName
	var property image
	var property speed = 200
	var property fallingObjectX = 9
	var property fallingObjectY = 11
	var property position = game.at( 0.randomUpTo(fallingObjectX),fallingObjectY)
	
	method appearObject(){
		game.addVisual(self)
        self.fall()
	}
	method fall(){
		game.onTick(speed, eventName, { self.moveDown() })
	}
	method moveDown(){
		if(not self.onTheFloor()){
			position = position.down(1)
		}else{
			self.disappear()
		}
	}
	method onTheFloor() = self.position().y() == 0
	method disappear(){
		if(self.thereIsFallingObject() ){
			game.removeVisual(self)
			game.removeTickEvent(eventName)
		}
	}
	method thereIsFallingObject() = game.hasVisual(self)
	method collisionWithCharacter(character)
}
class Apple inherits FallingObject{
	override method collisionWithCharacter(character){
		character.score(5)
		self.disappear()
	}
}