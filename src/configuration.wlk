import wollok.game.*

object configuration{
	//PROPERTIES
	const gameTitle = 'Sky Fruit Harvest'
	const boardBackground = './img/background.png'
	const boardHeight = 13
	const boardWidth = 9
	const property leftBoardLimit = game.at(0,0)
	const property rigthBoardLimit = game.at(boardWidth-1,0)
	
	//GAME START 
	method startLevel(){
		self.loadScreen()
	}
	
	//GENERATE UI
	method loadScreen(){
		game.title(gameTitle)
		game.height(boardHeight)
		game.width(boardWidth)
		game.boardGround(boardBackground)
	}
}