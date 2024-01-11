import wollok.game.*
import character.*
import texts.*

object configuration{
	//PROPERTIES
	const character = new Character()
	const characterScore = new ScoreText(character = character)
	const gameMenu = new MenuText()
	const gameTitle = 'Sky Fruit Harvest'
	const boardBackground = './img/background.png'
	const boardHeight = 13
	const boardWidth = 9
	const property leftBoardLimit = game.at(0,0)
	const property rightBoardLimit = game.at(boardWidth-1,0)
	
	//GAME START 
	method showMenu(){
		self.loadScreen()
		game.addVisual(gameMenu)
		self.startGame()
	}
	method startGame(){
		keyboard.enter().onPressDo{
			self.startLevel()
		}
	} 
	method startLevel(){
		self.clearScreen()
		self.loadScreen()
		self.loadCharacter()
		self.loadScore()
		self.defineKeys()
	}
	method clearScreen(){
		game.clear()
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
	method loadScore(){ 
		game.addVisual( characterScore )
	}
	
	//KEYBOARD MOVEMENT
	method defineKeys(){
		keyboard.a().onPressDo{ character.moveLeft()}
		keyboard.d().onPressDo{ character.moveRight()}
		keyboard.j().onPressDo{ /*Special items*/}
		keyboard.k().onPressDo{ /*Special items*/}
	}
}