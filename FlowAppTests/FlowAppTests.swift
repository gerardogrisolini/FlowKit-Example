//
//  FlowAppTests.swift
//  FlowAppTests
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import Testing

struct FlowAppTests {

    @Test func appFlow() async throws {
        try await AppFlow().test()
    }

}
