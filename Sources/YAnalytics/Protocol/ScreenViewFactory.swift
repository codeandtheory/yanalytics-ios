//
//  ScreenViewFactory.swift
//  YAnalytics
//
//  Created by Mark Pospesel on 3/8/23.
//  Copyright © 2023 Y Media Labs. All rights reserved.
//

import Foundation

/// Anything that generates an analytics event of type `AnalyticsEvent.screenView`
public protocol ScreenViewFactory: AnalyticsEventFactory {
    /// Screen name
    var screenName: String { get }
}

/// Default implementation of `event` property
public extension ScreenViewFactory {
    /// Generates an event (of type `.screenView`) from `screenName`
    var event: AnalyticsEvent {
        .screenView(screenName: screenName)
    }
}

/// RawRepresentable (e.g. all string-based enums) conforms to ScreenViewFactory by simply returning its raw value
extension RawRepresentable where RawValue == String {
    /// URL path string
    public var screenName: String { rawValue }
}
