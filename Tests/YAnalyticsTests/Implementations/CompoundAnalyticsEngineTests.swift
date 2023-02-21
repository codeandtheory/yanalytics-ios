//
//  CompoundAnalyticsEngineTests.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 7/19/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class CompoundAnalyticsEngineTests: XCTestCase {
    func testTrack() throws {
        // Given
        let sut = makeSUT()
        let mock1 = try XCTUnwrap(sut.engines[0] as? MockAnalyticsEngine)
        let mock2 = try XCTUnwrap(sut.engines[1] as? MockAnalyticsEngine)
        let data = MockAnalyticsData()
        let events = data.allEvents

        XCTAssert(mock1.allEvents.isEmpty)
        XCTAssert(mock2.allEvents.isEmpty)

        // When
        events.forEach { sut.track(event: $0) }

        // Then
        XCTAssertLogged(engine: mock1, data: data)
        XCTAssertLogged(engine: mock2, data: data)
    }
}

extension CompoundAnalyticsEngineTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CompoundAnalyticsEngine {
        let mock1 = MockAnalyticsEngine()
        let mock2 = MockAnalyticsEngine()
        let sut = CompoundAnalyticsEngine(engines: [mock1, mock2])
        trackForMemoryLeak(mock1, file: file, line: line)
        trackForMemoryLeak(mock2, file: file, line: line)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
