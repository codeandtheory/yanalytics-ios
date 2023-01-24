//
//  ConsoleAnalyticsEngine.swift
//  YAnalyticsTestHarnessTests
//
//  Created by Sumit Goswami on 18/01/22.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Prints analytics events to standard output.
///
/// This should be used only for debugging purposes.
/// If you're building for iOS 14+, consider using `LoggerAnalyticsEngine` instead.
/// You can combine this with your actual analytics engine by using `CompoundAnalyticsEngine`.
final public class ConsoleAnalyticsEngine {
    /// Category to prepend to each line of console output
    ///
    /// Rough corollary to `Logger.category` in Apple's unified logging system.
    public let category = "Analytics"

    /// Initialize console analytics engine
    public init() { }
}

// MARK: - AnalyticsEngine

/// Conform to `AnalyticsEngine` protocol
extension ConsoleAnalyticsEngine: AnalyticsEngine {
    /// Log an analytics event
    /// - Parameter event: the event to log
    public func track(event: AnalyticsEvent) {
        switch event {
        case .screenView(let screenName):
            print("[\(category)] Screen view: \(screenName)")
        case .userProperty(let name, let value):
            print("[\(category)] User property: \(name) = \(value)")
        case .event(let name, let parameters):
            if let parameters = parameters {
                print("[\(category)] Event: \(name), \(parameters)")
            } else {
                print("[\(category)] Event: \(name)")
            }
        }
    }
}
