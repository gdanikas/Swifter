//
//  MonitorPlusRiskAnalyticsManager.swift
//  RiskAnalytics
//
//  Created by Chiona Kapatou on 5/2/20.
//  Copyright © 2020 Advantage FSE. All rights reserved.
//

import Foundation
import UIKit
import FPL

public final class MonitorPlusRiskAnalyticsManager: NSObject, RiskAnalyticsManager {

    private let filter = MonitorPlusRiskAnalyticsFilter()
    public var riskAnalyticsData = MonitorPlusRiskAnalyticsData()

    public func process(
        request: URLRequest,
        onSuccess: @escaping RiskAnalyticsManager.SuccessAction,
        onFailure: @escaping RiskAnalyticsManager.FailureAction
    ) {
        self.monitorPlusRiskAnalyticsData()
        self.processRequest(request, onSuccess, onFailure)
    }

    /**
     * Initialization of the sdk
     * Initialize datadictionary with FingerPrint data.
     */
    private func fingerPrintData() {
        let fpdata = FingerPrint()
        riskAnalyticsData.dataString = fpdata.getData(action: "")
    }

    private func monitorPlusRiskAnalyticsData() {
        fingerPrintData()
        filter.data = riskAnalyticsData.collectData()
    }

    private func processRequest(
        _ request: URLRequest,
        _ onSuccess: @escaping RiskAnalyticsManager.SuccessAction,
        _ onFailure: @escaping RiskAnalyticsManager.FailureAction
    ) {
        filter.process(request: request) {
            processedRequest, error in

            if let error = error {
                #if DEBUG
                print("error processing request: \(error)")
                #endif
            } else if let processedRequest = processedRequest {
                self.processingDidSucceed(with: processedRequest, successAction: onSuccess)
            }
        }
    }

    private func processingDidSucceed(with request: URLRequest,
                                      successAction: SuccessAction) {
        successAction(request)
    }
}

