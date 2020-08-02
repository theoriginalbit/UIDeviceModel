import XCTest
@testable import UIDeviceModel

final class UIDeviceModelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UIDeviceModel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
