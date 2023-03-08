//
//  EventFactoryTests.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import XCTest
@testable import YAnalytics

final class EventFactoryTests: XCTestCase {
    func test_event_deliversEvent() throws {
        try MockEvent.allCases.forEach {
            switch $0.event {
            case .event(let name, let parameters):
                XCTAssertEqual(name, $0.name)
                let parameters = try XCTUnwrap(parameters as? [String: String])
                let expected = try XCTUnwrap($0.parameters as? [String: String])
                XCTAssertEqual(parameters, expected)
            default:
                XCTFail("Unexpected event type: \($0.event)")
            }
        }
    }
}

private extension EventFactoryTests {
    enum MockEvent: String, EventFactory, CaseIterable {
        case abc
        case def

        var name: String { rawValue }
        var parameters: Metadata? {
            [
                "value": "42\(rawValue.uppercased())",
                "type": "dictionary"
            ]
        }
    }
}
