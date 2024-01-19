import wollok.game.*
import character.*
import texts.*
import fallingObjects.*
import hearts.*

object configuration{
	//PROPERTIES
	const character = new Character()
	const characterScore = new ScoreText(character = character)
	const property heartBar = new HeartsBar(character = character, positionX = 0, positionY = 12)
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
		self.setInicialValues()
		self.clearScreen()
		self.loadScreen()
		self.loadCharacter()
		self.loadScore()
		self.defineKeys()
		self.loadFallingObjects()
		self.collisionWithCharacter()
		self.loadHeartBar()
	
	}
	method setInicialValues(){
		character.resetScore()
		character.resetLife()
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
	method loadFallingObjects(){
		game.onTick(300,"Fruits",{ new Fruit(eventName = "FallingFruits").appearObject()})
		game.onTick(500,"Poison",{ new PoisonousObject(eventName = "FallingPoisonousObject").appearObject()})
	}
	method loadHeartBar(){
		heartBar.createHeartBar()
		heartBar.hearts().forEach({ heart => game.addVisual(heart)})
	}
	method loseHeart(){
		game.removeVisual(heartBar.getLastHeart())
		heartBar.removeLastHeart()
	}
	//KEYBOARD MOVEMENT
	method defineKeys(){
		keyboard.a().onPressDo{ character.moveLeft()}
		keyboard.d().onPressDo{ character.moveRight()}
		keyboard.j().onPressDo{ /*Special items*/}
		keyboard.k().onPressDo{ /*Special items*/}
	} 
	//COLLISION WITH CHARACTER
	method collisionWithCharacter(){
		game.onCollideDo(character, { fallingObject => fallingObject.collisionWithCharacter(character) }) 
	}
	//GAME OVER
	method checkEndConditions(){
		if( self.isTheCharacterDead()){
			self.showGameOverScreen()
		}
	}
	method isTheCharacterDead() = character.isDead()
	method showGameOverScreen(){
		self.clearScreen()
		self.loadGameOverText()
		self.defineGameOverKeys()
	}
	method clearScreen(){
		game.clear()
	}
	method loadGameOverText(){ 
		game.addVisual(new GameOverText(character = character))
	}
	//GAME OVER OPTIONS
	method defineGameOverKeys(){
		self.restartGame()
		self.exitGame()
	}
	//KEYBOARD GAME OVER
	method restartGame(){
		keyboard.r().onPressDo{
			self.clearScreen()
			self.startLevel()
		}
	}
	method exitGame(){
		keyboard.e().onPressDo{ 
			game.schedule(500,{ => game.stop()})
		} 
	}
	
}