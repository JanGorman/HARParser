import XCTest
import HARParser

class HARParserTests: XCTestCase {

  func testItParses() throws {
    let data = try testData()
    let parser = HARParser(data: data)

    let har = try parser.parse()

    XCTAssertEqual(har.version, "1.2")
    XCTAssertEqual(har.creator.name, "Charles Proxy")
    XCTAssertEqual(har.creator.version, "4.2")
    XCTAssertEqual(har.entries.first?.request.method, .GET)
    XCTAssertEqual(har.entries.first?.request.cookies?.count, 1)
    XCTAssertNotNil(har.entries.first?.response.content.text)
  }

  private func testData() throws -> Data {
    return Fixture.har.data(using: .utf8)!
  }

  static var allTests = [
    ("testItParses", testItParses),
  ]

}
