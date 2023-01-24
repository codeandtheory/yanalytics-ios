//
//  MockAnalyticsEngine.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 7/20/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation
@testable import YAnalytics

/// Analytics Engine implementation for unit tests
final class MockAnalyticsEngine {
    private(set) var screenViews: [String] = []
    private(set) var userProperties: [String: String] = [:]
    private(set) var events: [String: [String: Any]?] = [:]
}

extension MockAnalyticsEngine: AnalyticsEngine {
    func track(event: AnalyticsEvent) {
        switch event {
        case .screenView(screenName: let screenName):
            screenViews.append(screenName)
        case .userProperty(name: let name, value: let value):
            userProperties[name] = value
        case .event(name: let name, parameters: let parameters):
            events[name] = parameters
        }
    }
}
