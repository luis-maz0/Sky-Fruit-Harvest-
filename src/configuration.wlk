import wollok.game.*
import character.*

object configuration{
	//PROPERTIES
	const character = new Character()
	const gameTitle = 'Sky Fruit Harvest'
	const boardBackground = './img/background.png'
	const boardHeight = 13
	const boardWidth = 9
	const property leftBoardLimit = game.at(0,0)
	const property rightBoardLimit = game.at(boardWidth-1,0)
	
	//GAME START 
	method startLevel(){
		self.loadScreen()
		self.loadCharacter()
		self.defineKeys()
	} 
	
	//GENERATE UI
	method loadScreen(){
		game.title(gameTitle)
		game.height(boardHeight)
		game.width(boardWidth)
		game.boardGround(boardBackground)
	}
	method loadCharacter(){
		game.addVisual(character)	
	}
	
	//KEYBOARD MOVEMENT
	method defineKeys(){
		keyboard.a().onPressDo{ character.moveLeft()}
		keyboard.d().onPressDo{ character.moveRight()}
		keyboard.j().onPressDo{ /*Special items*/}
		keyboard.k().onPressDo{ /*Special items*/}
	}
}