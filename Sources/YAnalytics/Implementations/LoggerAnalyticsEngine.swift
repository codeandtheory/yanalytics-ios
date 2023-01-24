//
//  LoggerAnalyticsEngine.swift
//  YAnalytics
//
//  Created by Sumit Goswami on 17/01/22.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation
import os

/// Logs analytics events to Apple's unified logging system.
///
/// This should be used only for debugging purposes.
/// You can combine this with your actual analytics engine by using `CompoundAnalyticsEngine`.
final public class LoggerAnalyticsEngine {
    private let logger = Logger(subsystem: "co.yml.yanalytics.Core", category: "Analytics")

    /// Initialize logger analytics engine
    public init() { }
}

/// Conform to `AnalyticsEngine` protocol
extension LoggerAnalyticsEngine: AnalyticsEngine {
    /// Log an analytics event
    /// - Parameter event: the event to log
    public func track(event: AnalyticsEvent) {
        switch event {
        case .screenView(let screenName):
            logger.debug("Screen view: \(screenName, privacy: .public)")
        case .userProperty(let name, let value):
            logger.debug("User property: \(name, privacy: .public) = \(value, privacy: .private)")
        case .event(let name, let parameters):
            if let parameters = parameters {
                logger.debug("Event: \(name, privacy: .public), \(parameters, privacy: .private)")
            } else {
                logger.debug("Event: \(name, privacy: .public)")
            }
        }
    }
}
