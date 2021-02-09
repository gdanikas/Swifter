//
//  MonitorPlusRiskAnalyticsData.swift
//  RiskAnalytics
//
//  Created by Chiona Kapatou on 14/2/20.
//  Copyright © 2020 Advantage FSE. All rights reserved.
//

import Foundation

public final class MonitorPlusRiskAnalyticsData: NSObject {
    public var dataString: String = ""

    public func collectData() -> Data {
        var data = Data()
        if let jsonData = dataString.data(using: .utf8) {
            data = jsonData
        }
        return data
    }
}
