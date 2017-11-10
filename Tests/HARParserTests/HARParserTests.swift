import XCTest
@testable import HARParser

class HARParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HARParser().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
