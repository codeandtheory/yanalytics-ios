//
//  AnalyticsEvent.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 7/23/21.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// String-keyed dictionary of analytics data.
/// Used with `AnalyticsEvent.event(name:parameters:)`.
public typealias Metadata = [String: Any]

/// Represents any event we might wish to track via analytics
public enum AnalyticsEvent {
    /// Screen view event
    /// - Parameter screenName: screen name
    case screenView(screenName: String)
    /// User property event
    /// - Parameters:
    ///   - name: user property name
    ///   - value: user property value
    case userProperty(name: String, value: String)
    /// Generic event
    /// - Parameters:
    ///   - name: event name
    ///   - parameters: event metadata to track
    case event(name: String, parameters: Metadata?)
}

public extension AnalyticsEvent {
    /// Unique key for `AnalyticsEvent.screenView` events
    static let screenViewKey = "screenView"

    /// Unique key for `AnalyticsEvent.userProperty` events
    static let userPropertyKey = "userProperty"

    /// Unique key for `AnalyticsEvent.event` events
    static let eventKey = "event"
}
