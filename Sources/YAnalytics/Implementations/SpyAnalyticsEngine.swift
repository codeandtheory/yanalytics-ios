//
//  SpyAnalyticsEngine.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 2/21/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Spies upon an analytic engine by also tracking events to a separate mock that can be queried.
///
/// Use this only for unit testing. Consider whether `MockAnalyticsEngine` might be a better fit.
final public class SpyAnalyticsEngine {
    /// Engine to be spied upon
    public let engine: AnalyticsEngine
    /// Mock analytics engine
    public let mock = MockAnalyticsEngine()

    /// Initialize spy analytics engine.
    /// `track(event:)` will be called on this engine and an associated mock
    /// - Parameter engine: engine to be spied upon
    public init(engine: AnalyticsEngine) {
        self.engine = engine
    }
}

// MARK: - AnalyticsEngine

/// Conform to `AnalyticsEngine` protocol
extension SpyAnalyticsEngine: AnalyticsEngine {
    /// Track an analytics event
    /// - Parameter event: the event to log
    public func track(event: AnalyticsEvent) {
        engine.track(event: event)
        mock.track(event: event)
     }
}
