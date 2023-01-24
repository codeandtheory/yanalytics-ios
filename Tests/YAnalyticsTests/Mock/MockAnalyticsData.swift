//
//  MockAnalyticsData.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 7/20/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation
@testable import YAnalytics

/// Sample Analytics data for unit tests
struct MockAnalyticsData {
    let screens = [
        "loginScreen",
        "homeScreen",
        "menuScreen"
    ]
    
    let userProperties: [(String, String)] = [
        ("user", "Bob"),
        ("user", "Alice"), // repeat title
        ("isProduction", "true"),
        ("environment", "sandbox")
    ]
    
    let events: [(String, Metadata?)] = [
        ("login", ["user": "Bob", "password": "secret"]),
        ("lowMemory", nil),
        ("signOut", ["isManual": true])
    ]
    
    lazy private(set) var allEvents: [AnalyticsEvent] = {
        var allEvents: [AnalyticsEvent] = []
        screens.forEach {
            allEvents.append(.screenView(screenName: $0))
        }
        
        userProperties.forEach {
            allEvents.append(.userProperty(name: $0.0, value: $0.1))
        }
        
        events.forEach {
            allEvents.append(.event(name: $0.0, parameters: $0.1))
        }
        
        return allEvents
    }()
}
