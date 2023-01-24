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
}
