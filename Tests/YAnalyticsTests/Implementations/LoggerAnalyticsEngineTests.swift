//
//  LogAnalyticsEngineTests.swift
//  YAnalyticsTestHarnessTests
//
//  Created by Sumit Goswami on 17/01/22.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class LoggerAnalyticsEngineTests: XCTestCase {
    private var data: MockAnalyticsData!
    private var sut: AnalyticsEngine!
    private var logger: LoggerAnalyticsEngine!
    private var mock: MockAnalyticsEngine!

    override func setUp() {
        super.setUp()
        data = MockAnalyticsData()
        mock = MockAnalyticsEngine()
        logger = LoggerAnalyticsEngine()
        sut = CompoundAnalyticsEngine(engines: [logger, mock])
    }

    override func tearDown() {
        super.tearDown()
        data = nil
        mock = nil
        logger = nil
        sut = nil
    }

    func testLogging() {
        XCTAssert(mock.screenViews.isEmpty)
        XCTAssert(mock.userProperties.isEmpty)
        XCTAssert(mock.events.isEmpty)

        data.allEvents.forEach { sut.track(event: $0) }

        XCTAssertEqual(mock.screenViews.count, data.screens.count)
        XCTAssertEqual(mock.userProperties.count, data.userProperties.count - 1) // there's 1 repeat user property
        XCTAssertEqual(mock.events.count, data.events.count)
    }
}
