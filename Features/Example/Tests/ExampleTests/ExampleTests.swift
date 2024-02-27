import XCTest
@testable import Example

final class ExampleTests: XCTestCase {
    func testExampleFlow() async throws {
        try await ExampleFlow().test()
    }

    func testUpdateOnPage2View() async throws {
        let sut = Page2View()
        let time = sut.model.time
        try await Task.sleep(nanoseconds: 1000000000)
        try await sut.test(event: .update(Date()))
        XCTAssertNotEqual(time, sut.model.time)
    }
}
