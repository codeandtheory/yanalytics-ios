//
//  UserPropertyFactory.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Anything that generates an analytics event of type `AnalyticsEvent.userProperty`
public protocol UserPropertyFactory: AnalyticsEventFactory {
    /// Property name
    var name: String { get }
    /// Property value
    var value: String { get }
}

/// Default implementation of `event` property
public extension UserPropertyFactory {
    /// Generates an event (of type `.userProperty`) from `name` and `value`
    var event: AnalyticsEvent {
        .userProperty(name: name, value: value)
    }
}
