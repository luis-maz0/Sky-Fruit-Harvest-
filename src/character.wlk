import wollok.game.*
import configuration.*

class Character{
	//PROPERTIES
	var property life = 3
	var property score = 0
	var property position = game.at(4,0)
	const property image = './img/character_manu.png'
	var property specialFruits = []
	
	//SCORE
	method score(value){ score += value }
	method score() =  0.max(score)
	method resetScore(){ score = 0}
	
	//MOVEMENT 
	method moveLeft(){
		if( self.position() != configuration.leftBoardLimit()){
			position = self.position().left(1)
		}
	}
	method moveRight(){
		if( self.position() != configuration.rightBoardLimit()){
			position = self.position().right(1)
		}
	}
	//LIFE 
	method takeDamage(){
		if(not self.isDead()){
			self.loseLife()
			self.screamPain()	
		}
	}
	method isDead() = life < 1
	method loseLife(){
		life = life - 1
	} 
	method gainLife(){
		life = life + 1 
	}
	method resetLife(){
		life = 3
	}
	method screamPain(){
		game.say(self, "OH M@#%!&R")
	}
	//SPECIAL FRUITS
	method collectSpecialFruit(fruit){
		if( not self.itIsOnListOfSpecialFruits(fruit)){
			specialFruits.add(fruit)
		}
	}
	method itIsOnListOfSpecialFruits(fruit) { 
		return specialFruits.any({ specialFruit => specialFruit.name() == fruit.name() })
	}	
	method useSpecialFruit(fruitName){
		self.validateSearchInSpecialFruits(fruitName)
		self.consumeSpecialFruit(fruitName)
		self.deleteFromSpecialFruits(fruitName)
	}
	method validateSearchInSpecialFruits(fruitName){
		if(not self.specialFruitWasFound(fruitName)) self.error("NO TENGO " + fruitName)
	}
	method specialFruitWasFound(fruitName){
		return specialFruits.any({specialFruit => specialFruit.nombre() == fruitName})
	}
	method consumeSpecialFruit(fruitName){
		self.returnSpecialFruit(fruitName).consume(self)
	}
	method returnSpecialFruit(fruitName){
		return specialFruits.find({ specialFruit => specialFruit.nombre() == fruitName})
	}
	method deleteFromSpecialFruits(fruitName){
		if(self.specialFruitWasFound(fruitName))
			specialFruits.removeAllSuchThat({ specialFruit => specialFruit.nombre() == fruitName})
	}
}
