import wollok.game.*
import configuration.*

class FallingObject {
	var property image = null
	var property eventName
	var property speed = 200
	var property fallingObjectX = 9
	var property fallingObjectY = 11
	var property position = game.at( 0.randomUpTo(fallingObjectX),fallingObjectY)
	
	method appearObject(){
		self.selectFruitImage()
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
	//ABSTRACT METHODS 
	method collisionWithCharacter(character)
	method selectFruitImage()
}
class Fruit inherits FallingObject{
	override method collisionWithCharacter(character){
		character.score(5)
		self.disappear()
	}
	override method selectFruitImage(){
		image = ["./img/apple.png", "./img/orange.png", "./img/pear.png"].anyOne()	
	}
}
class PoisonousObject inherits FallingObject{
	override method collisionWithCharacter(character){
		character.takeDamage()
		configuration.loadHeartBar()
		self.disappear()
	}
	override method selectFruitImage(){
		image = "./img/poisonFruit.png"
	}
}