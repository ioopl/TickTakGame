import XCTest
@testable import TickTakGame

class GameTests: XCTestCase {

    let game = Game(playerOne: "John", playerTwo: "Wick")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game.start(columns: 3, rows: 3)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGameboardIsAffectedByPlay(){
        let coordinate = Coordinate(1,1)
        _ = game.move(state: State.X, coordinate: coordinate)
        let box = game.brain.getValueOnCoordinate(coordinate: coordinate)!
        
        XCTAssertEqual(box, State.X)
    }
    
    func testCanSetPlayers(){
        XCTAssertEqual(game.playerOne, "John")
        XCTAssertEqual(game.playerTwo, "Wick")
    }

}
