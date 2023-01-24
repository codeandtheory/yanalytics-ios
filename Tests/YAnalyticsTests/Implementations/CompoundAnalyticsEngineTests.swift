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
    private var sut: CompoundAnalyticsEngine!
    private var mock1: MockAnalyticsEngine!
    private var mock2: MockAnalyticsEngine!
    private var data: MockAnalyticsData!

    override func setUp() {
        super.setUp()
        
        mock1 = MockAnalyticsEngine()
        mock2 = MockAnalyticsEngine()
        sut = CompoundAnalyticsEngine(engines: [mock1, mock2])
        data = MockAnalyticsData()
    }

    override func tearDown() {
        super.tearDown()
        mock1 = nil
        mock2 = nil
        sut = nil
        data = nil
    }

    func testTrack() {
        XCTAssert(mock1.screenViews.isEmpty)
        XCTAssert(mock2.screenViews.isEmpty)
        XCTAssert(mock1.userProperties.isEmpty)
        XCTAssert(mock2.userProperties.isEmpty)
        XCTAssert(mock1.events.isEmpty)
        XCTAssert(mock2.events.isEmpty)

        data.allEvents.forEach { sut.track(event: $0) }
        
        XCTAssertFalse(mock1.screenViews.isEmpty)
        XCTAssertFalse(mock2.screenViews.isEmpty)
        XCTAssertFalse(mock1.userProperties.isEmpty)
        XCTAssertFalse(mock2.userProperties.isEmpty)
        XCTAssertFalse(mock1.events.isEmpty)
        XCTAssertFalse(mock2.events.isEmpty)
        
        data.allEvents.forEach {
            switch $0 {
            case .screenView(screenName: let screenName):
                XCTAssert(mock1.screenViews.contains(screenName))
                XCTAssert(mock2.screenViews.contains(screenName))
            case .userProperty(name: let name, value: _):
                XCTAssertNotNil(mock1.userProperties[name])
                XCTAssertNotNil(mock2.userProperties[name])
            case .event(name: let name, parameters: _):
                XCTAssert(mock1.events.keys.contains(name))
                XCTAssert(mock2.events.keys.contains(name))
            }
        }
    }
}
