import wollok.game.*
import configuration.*

class Character{
	//PROPERTIES
	var property life = 3
	var property score = 0
	var property position = game.at(4,0)
	const property image = './img/character_manu.png'
	var property specialItems = []
	
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
}
