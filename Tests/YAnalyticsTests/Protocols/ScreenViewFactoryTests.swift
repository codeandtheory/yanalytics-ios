//
//  ScreenViewFactoryTests.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class ScreenViewFactoryTests: XCTestCase {
    func test_event_deliversEvent() {
        MockScreenView.allCases.forEach {
            switch $0.event {
            case .screenView(let screenName):
                XCTAssertEqual(screenName, $0.screenName)
                XCTAssertEqual(screenName, $0.rawValue)
            default:
                XCTFail("Unexpected event type: \($0.event)")
            }
        }
    }
}

private extension ScreenViewFactoryTests {
    enum MockScreenView: String, ScreenViewFactory, CaseIterable {
        case abc
        case def
    }
}
