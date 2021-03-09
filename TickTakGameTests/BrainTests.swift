import XCTest
@testable import TickTakGame

class BrainTests: XCTestCase {

    let brain = Brain(centerCoordinate: Coordinate(1,1))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlayChangeValueOfBox(){
        let coordinate = Coordinate(0,2)
        _ = brain.play(state: State.O, coordinate: coordinate)
        let box = brain.getValueOnCoordinate(coordinate: coordinate)
        XCTAssertEqual(box, State.O)
    }

    func testUserWinsHorrizontally(){
        _ = brain.play(state: State.O, coordinate: Coordinate(0,0))
        _ = brain.play(state: State.X, coordinate: Coordinate(1,1))
        _ = brain.play(state: State.O, coordinate: Coordinate(2,0))
        _ = brain.play(state: State.X, coordinate: Coordinate(2,2))
        let result = brain.play(state: State.O, coordinate: Coordinate(1,0))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
    
    func testUserWinsVertically(){
        _ = brain.play(state: State.O, coordinate: Coordinate(1,1))
        _ = brain.play(state: State.O, coordinate: Coordinate(1,2))
        let result = brain.play(state: State.O, coordinate: Coordinate(1,0))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
    
    func testUserWinsDiagonally(){
        _ = brain.play(state: State.O, coordinate: Coordinate(0,0))
        _ = brain.play(state: State.O, coordinate: Coordinate(1,1))
        let result = brain.play(state: State.O, coordinate: Coordinate(2,2))
        XCTAssertNotNil(result.boxes)
        XCTAssertEqual(result.won, true)
    }
}
