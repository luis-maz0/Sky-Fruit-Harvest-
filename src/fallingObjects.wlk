import wollok.game.*
import configuration.*

class FallingObject {
	var property image = null
	var property eventName
	var property speed = 100
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
class RegularFruit inherits FallingObject{
	override method collisionWithCharacter(character){
		character.score(5)
		self.disappear()
	}
	override method selectFruitImage(){
		image = ["./img/apple.png", "./img/orange.png", "./img/pear.png"].anyOne()	
	}
}
class RevitalizingFruit inherits FallingObject{
	const property name = "grapes"
	const property boardPositionX = 7
	const property boardPositionY = 12
	
	override method collisionWithCharacter(character){
		character.collectSpecialFruit(self)
		self.positionFruit()
	}
	override method selectFruitImage(){
		image = "./img/grapes.png"
	}
	method positionFruit(){
		position = game.at(self.boardPositionX(),self.boardPositionY())
		game.removeTickEvent(eventName)
	}
	method consume(character){
		if( character.life() < 3){
			character.gainLife()
			configuration.gainHeart()
			character.scream("Wubba Lubba Dub Dub!")	
		}
		game.removeVisual(self)
	}
}
class RareFruit inherits RevitalizingFruit{
	override method name() = "pitahaya"
	override method boardPositionX() = 8
	override method selectFruitImage(){
		image = "./img/pitahaya.png"
	}
	override method positionFruit(){
		position = game.at(8,12)
		game.removeTickEvent(eventName)
	}
	override method consume(character){
		character.scream("Oh Geez")
		character.score(300)
		game.removeVisual(self)
	}
}
class PoisonousFruit inherits FallingObject{
	override method collisionWithCharacter(character){
		character.takeDamage()
		character.scream("OH M@#%!&R")
		configuration.loseHeart()
		configuration.checkEndConditions()
		self.disappear()
	}
	override method selectFruitImage(){
		image = "./img/poisonFruit.png"
	}
}