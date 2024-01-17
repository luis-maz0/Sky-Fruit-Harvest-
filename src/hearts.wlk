import wollok.game.*

class Heart{
	var property positionX
	var property positionY
	var property position = game.at(positionX, positionY)
	var property image = "./img/heart.png"	
	
}
class HeartsBar inherits Heart{
	const property hearts = [] 
	const property character
	
	method characterHearts() = character.life()
	
	method createHeartBar(){	
		self.characterHearts().times({ i => self.addHeart(i) })
	}
	method addHeart(amount){
		hearts.add( new Heart(positionX = positionX + (amount-1) , positionY = positionY))
	}
	method removeLastHeart(){
		hearts.remove(self.getLastHeart())
	}
	method getLastHeart() = hearts.last()
	
	
}

