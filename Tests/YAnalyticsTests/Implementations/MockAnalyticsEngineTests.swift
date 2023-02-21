//
//  MockAnalyticsEngineTests.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 2/21/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class MockAnalyticsEngineTests: XCTestCase {
    func testTrack() throws {
        // Given
        let sut = makeSUT()
        let data = MockAnalyticsData()

        XCTAssertTrue(sut.allEvents.isEmpty)

        // When
        data.allEvents.forEach { sut.track(event: $0) }

        // Then
        XCTAssertLogged(engine: sut, data: data)
    }
}

extension MockAnalyticsEngineTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> MockAnalyticsEngine {
        let sut = MockAnalyticsEngine()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
