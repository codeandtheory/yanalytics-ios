//
//  SpyAnalyticsEngineTests.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 2/21/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class SpyAnalyticsEngineTests: XCTestCase {
    func testTrack() throws {
        // Given
        let sut = makeSUT()
        let counter = try XCTUnwrap(sut.engine as? CountAnalyticsEngine)
        let data = MockAnalyticsData()
        let allEvents = data.allEvents

        XCTAssertEqual(counter.count, 0)
        XCTAssertTrue(sut.mock.allEvents.isEmpty)

        // When
        allEvents.forEach { sut.track(event: $0) }

        // Then
        XCTAssertEqual(counter.count, allEvents.count)
        XCTAssertLogged(engine: sut, data: data)
    }
}

extension SpyAnalyticsEngineTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> SpyAnalyticsEngine {
        let engine = CountAnalyticsEngine()
        let sut = SpyAnalyticsEngine(engine: engine)
        trackForMemoryLeak(engine, file: file, line: line)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}

final class CountAnalyticsEngine {
    private(set) var count: Int = 0
}

extension CountAnalyticsEngine: AnalyticsEngine {
    func track(event: YAnalytics.AnalyticsEvent) {
        count += 1
    }
}
