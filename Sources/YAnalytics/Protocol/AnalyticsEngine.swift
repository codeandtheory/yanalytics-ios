//
//  AnalyticsEngine.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 7/23/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Generic analytics functions to abstract away from specific implementations (Firebase etc)
public protocol AnalyticsEngine {
    /// Track an analytics event
    /// - Parameter event: the event to log
    func track(event: AnalyticsEvent)

    /// Tracks an analytics event
    /// - Parameter factory: object that generates the event to log
    func track(event factory: AnalyticsEventFactory)
}

/// Default implementation of `track(factory:)`
extension AnalyticsEngine {
    /// Tracks an analytics event.
    ///
    /// Extracts the event from the factory and tracks that.
    /// - Parameter factory: object that generates the event to log
    public func track(event factory: AnalyticsEventFactory) {
        track(event: factory.event)
    }
}
