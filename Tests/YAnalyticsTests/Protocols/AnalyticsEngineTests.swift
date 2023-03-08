//
//  AnalyticsEngineTests.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class AnalyticsEngineTests: XCTestCase {
    func test_trackFactory_tracksEvents() {
        // Given
        let engine = MockAnalyticsEngine()

        // When
        MockEvent.allCases.forEach {
            engine.track(event: $0)
        }

        // Then
        XCTAssertEqual(engine.allEvents.count, 3)
        XCTAssertEqual(engine.screenViews.joined(), "abcdefxyz")
    }
}

private extension AnalyticsEngineTests {
    enum MockEvent: String, CaseIterable, ScreenViewFactory {
        case abc
        case def
        case xyz
    }
}
