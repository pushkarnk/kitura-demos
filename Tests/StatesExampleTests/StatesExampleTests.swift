import XCTest
@testable import StatesExample

class StatesExampleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(StatesExample().text, "Hello, World!")
    }


    static var allTests : [(String, (StatesExampleTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
