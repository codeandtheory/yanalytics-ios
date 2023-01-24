//
//  CompoundAnalyticsEngine.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 7/19/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Combines multiple Analytics Engines into a single engine.
///
/// Use this only if you have multiple engines.
final public class CompoundAnalyticsEngine {
    /// Array of analytics engines to iterate over
    public let engines: [AnalyticsEngine]
    
    /// Initialize compound analytics engine.
    /// `track(event:)` will be called on each engine in array order.
    /// - Parameter engines: array of engines to combine
    public init(engines: [AnalyticsEngine]) {
        self.engines = engines
    }
}

// MARK: - AnalyticsEngine

/// Conform to `AnalyticsEngine` protocol
extension CompoundAnalyticsEngine: AnalyticsEngine {
    /// Track an analytics event
    /// - Parameter event: the event to log
    public func track(event: AnalyticsEvent) {
        engines.forEach { $0.track(event: event) }
    }
}
