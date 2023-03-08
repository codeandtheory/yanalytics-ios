//
//  AnalyticsEventFactory.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Anything that generates an analytics event.
///
/// Three protocols, `ScreenViewFactory`, `UserPropertyFactory`, and `EventFactory`, conform to `AnalyticsEventFactory`;
/// one for each of the three cases in the `AnalyticsEvent` enum.
public protocol AnalyticsEventFactory {
    /// The event
    var event: AnalyticsEvent { get }
}
