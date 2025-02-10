//
//  FlowAppTests.swift
//  FlowAppTests
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import Testing
@testable import FlowApp

struct FlowAppTests {

    @Test @MainActor func appFlow() async throws {
        try await AppFlow().test()
    }

}
