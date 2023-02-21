//
//  MockAnalyticsEngine.swift
//  YAnalyticsTests
//
//  Created by Mark Pospesel on 7/20/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Mock analytics engine. Stores events to an `allEvents` array each time
/// `track(event:)` is called. It also stores information by event type.
///
/// Use this only for unit testing. Consider whether `SpyAnalyticsEngine` might be a better fit.
final public class MockAnalyticsEngine {
    /// Array of all events tracked
    public var allEvents: [AnalyticsEvent] = []

    /// Ordered array of screen names tracked in `.screenView` events
    public private(set) var screenViews: [String] = []
    /// Dictionary of user properties tracked in `.userProperty` events
    public private(set) var userProperties: [String: String] = [:]
    /// Dictionary of event metadata tracked in `.event` events
    public private(set) var events: [String: Metadata?] = [:]
}

// MARK: - AnalyticsEngine

extension MockAnalyticsEngine: AnalyticsEngine {
    /// Log an analytics event
    /// - Parameter event: the event to log
    public func track(event: AnalyticsEvent) {
        allEvents.append(event)
        
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
