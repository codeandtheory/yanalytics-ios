//
//  ConsoleAnalyticsEngineTests.swift
//  YAnalyticsTestHarnessTests
//
//  Created by Sumit Goswami on 18/01/22.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class ConsoleAnalyticsEngineTests: XCTestCase {
    func testTrack() {
        // Given
        let sut = makeSUT()
        let data = MockAnalyticsData()

        XCTAssert(sut.mock.allEvents.isEmpty)

        // When
        data.allEvents.forEach { sut.track(event: $0) }

        // Then
        XCTAssertLogged(engine: sut, data: data)
    }
}

extension ConsoleAnalyticsEngineTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> SpyAnalyticsEngine {
        let engine = ConsoleAnalyticsEngine()
        let sut = SpyAnalyticsEngine(engine: engine)
        trackForMemoryLeak(engine, file: file, line: line)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
