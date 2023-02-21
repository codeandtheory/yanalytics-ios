//
//  XCTestCase+AssertLogged.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 2/21/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

extension XCTestCase {
    func XCTAssertLogged(engine: AnalyticsEngine, data: MockAnalyticsData) {
        if let mock = engine as? MockAnalyticsEngine {
            XCTAssertLogged(mock: mock, data: data)
        } else if let spy = engine as? SpyAnalyticsEngine {
            XCTAssertLogged(spy: spy, data: data)
        } else {
            XCTFail("Engine must be mock or spy.")
        }
    }

    func XCTAssertLogged(spy: SpyAnalyticsEngine, data: MockAnalyticsData) {
        XCTAssertLogged(mock: spy.mock, data: data)
    }

    func XCTAssertLogged(mock sut: MockAnalyticsEngine, data: MockAnalyticsData) {
        XCTAssertEqual(sut.allEvents.count, data.allEvents.count)
        XCTAssertEqual(sut.screenViews, data.screens)
        XCTAssertEqual(sut.userProperties.count, data.userProperties.count - 1) // there's 1 repeat user property
        sut.userProperties.forEach { key, value in
            XCTAssertTrue(data.userProperties.map { $0.0 }.contains(key))
            XCTAssertTrue(data.userProperties.map { $0.1 }.contains(value))
        }
        XCTAssertEqual(sut.events.count, data.events.count)
        sut.events.keys.forEach {
            XCTAssertTrue(data.events.map { $0.0 }.contains($0))
        }
    }
}
