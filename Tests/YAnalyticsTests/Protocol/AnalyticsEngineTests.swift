//
//  AnalyticsEngineTests.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 7/19/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class AnalyticsEngineTests: XCTestCase {
    private var sut: MockAnalyticsEngine!
    private var data: MockAnalyticsData!

    override func setUp() {
        super.setUp()
        
        sut = MockAnalyticsEngine()
        data = MockAnalyticsData()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        data = nil
    }

    func testTrackEvent() {
        XCTAssert(sut.screenViews.isEmpty)
        XCTAssert(sut.userProperties.isEmpty)
        XCTAssert(sut.events.isEmpty)

        data.allEvents.forEach { sut.track(event: $0) }
        
        XCTAssertFalse(sut.screenViews.isEmpty)
        XCTAssertFalse(sut.userProperties.isEmpty)
        XCTAssertFalse(sut.events.isEmpty)
        
        data.allEvents.forEach {
            switch $0 {
            case .screenView(screenName: let screenName):
                XCTAssert(sut.screenViews.contains(screenName))
            case .userProperty(name: let name, value: _):
                XCTAssertNotNil(sut.userProperties[name])
            case .event(name: let name, parameters: _):
                XCTAssert(sut.events.keys.contains(name))
            }
        }
    }
}
