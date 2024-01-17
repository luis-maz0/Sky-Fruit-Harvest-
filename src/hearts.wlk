import wollok.game.*

class Heart{
	var property positionX
	var property positionY
	var property position = game.at(positionX, positionY)
	const property image = "./img/heart.png"	
}
class HeartBar inherits Heart{
	const property hearts = [] 
	var property characterHearts
	
	method characterHearts(value){
		characterHearts -= value
	}
	
	method createHeartBar(){
		self.clearHearts()
		characterHearts.times({ i => self.addHeart(i) })
	}
	method addHeart(amount){
		hearts.add( new Heart(positionX = positionX + (amount-1) , positionY = positionY))
	}
	method clearHearts(){
		hearts.clear()
	}
}
