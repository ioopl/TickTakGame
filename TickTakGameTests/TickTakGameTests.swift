import XCTest
@testable import TickTakGame

class TickTakGameTests: XCTestCase {

    var viewController : ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
    }

    func testStartGame(){
        viewController.start(playerOne: "John", playerTwo: "Wick")
        XCTAssertNotNil(viewController.game)
    }
    
    
    func testPlayerOnePlay(){
        viewController.start(playerOne: "John", playerTwo: "Wick")
        let state =  State.X
        let coordinate =  Coordinate(1,1)
        _ = viewController.play(coordinate: coordinate)
        XCTAssertEqual(viewController.isPlayerOne, false)
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate: coordinate), state)
    }
    
    func testPlayerTwoPlay(){
        viewController.start(playerOne: "John", playerTwo: "Wick")
        _ = viewController.play(coordinate: Coordinate(1,1))
        
        let coordinate =  Coordinate(0,1)
        _ = viewController.play(coordinate: coordinate)
        XCTAssert(viewController.isPlayerOne)
        
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate: coordinate), State.O)
    }
    
    
    func testPlayerTryToPlayOnAnInvalidBox(){
        viewController.start(playerOne: "John", playerTwo: "Wick")
        let coordinate =  Coordinate(0,1)
        _ = viewController.play(coordinate: coordinate)
        _ = viewController.play(coordinate: coordinate)
        XCTAssertEqual(viewController.isPlayerOne, false)
        XCTAssertEqual(viewController.game?.brain.getValueOnCoordinate(coordinate: coordinate), State.X)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
