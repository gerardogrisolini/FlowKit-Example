import XCTest
import FlowNetwork
import FlowShared
@testable import Example

final class ExampleTests: XCTestCase {
    func testExampleFlow() async throws {
        try await ExampleFlow().test()
    }

    func testUpdateOnPage2View() async throws {
        let sut = await Page2View(model: InOutModel(), service: ExampleServiceMock())
        let time1 = await sut.model.time
        try await Task.sleep(nanoseconds: 1000000000)
        try await sut.test(event: .update(Date()))
        let time2 = await sut.model.time
        XCTAssertNotEqual(time1, time2)
    }
}

class ExampleServiceMock: ExampleServiceProtocol {
    var date = Date()
    func getUserInfo() async throws -> UserInfoModel {
        UserInfoModel(id: 1, isAdmin: true, date: date)
    }

    func updateUserInfo(date: Date) async throws {
        self.date = date
    }
}
