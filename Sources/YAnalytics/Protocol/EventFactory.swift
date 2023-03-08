//
//  EventFactory.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Anything that generates an analytics event of type `AnalyticsEvent.event`
public protocol EventFactory: AnalyticsEventFactory {
    /// Event name
    var name: String { get }
    /// Event parameters
    var parameters: Metadata? { get }
}

/// Default implementation of `event` property
public extension EventFactory {
    /// Generates an event (of type `.event`) from `name` and `parameters`
    var event: AnalyticsEvent {
        .event(name: name, parameters: parameters)
    }
}
