//
//  UserPropertyFactoryTests.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class UserPropertyFactoryTests: XCTestCase {
    func test_event_deliversEvent() {
        MockUserProperty.allCases.forEach {
            switch $0.event {
            case .userProperty(let name, let value):
                XCTAssertEqual(name, $0.name)
                XCTAssertEqual(value, $0.value)
                XCTAssertEqual(value, $0.name.capitalized)
            default:
                XCTFail("Unexpected event type: \($0.event)")
            }
        }
    }
}

private extension UserPropertyFactoryTests {
    enum MockUserProperty: String, UserPropertyFactory, CaseIterable {
        case abc
        case def

        var name: String { rawValue }
        var value: String { rawValue.capitalized }
    }
}
