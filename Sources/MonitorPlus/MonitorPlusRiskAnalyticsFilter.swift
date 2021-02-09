//
//  MonitorPlusRiskAnalyticsFilter.swift
//  RiskAnalytics
//
//  Created by Chiona Kapatou on 14/2/20.
//  Copyright © 2020 Advantage FSE. All rights reserved.
//

import Foundation

private let mobileMonitorPlusHeaderName = "MOBILECDDC"
private let starHTTPMethod = "*"

public final class MonitorPlusRiskAnalyticsFilter: NSObject, URLRequestFilter {

    public var data: Data!

    // MARK: - PUBLIC
    @objc public override init() {}

    @objc(processRequest:onCompletion:)
    public func process(request: URLRequest, onCompletion completion: @escaping Completion) {

        guard let _ = request.url as NSURL? else {
            completion(nil, RiskAnalyticsFilterError.invalidRequest(request))
            return
        }

        guard let httpMethod = request.httpMethod, !httpMethod.isEmpty else {
            completion(nil, RiskAnalyticsFilterError.invalidRequest(request))
            return
        }

        _process(request: request, completion: completion)
    }

    // MARK: - PRIVATE

    private func _process(request: URLRequest, completion: @escaping Completion) {

        var processedRequest: URLRequest? = request
        addData(data, toRequest: &processedRequest!)

        completion(processedRequest, nil)
    }

    private func addData(_ data: Data, toRequest request: inout URLRequest) {

        var headerValue = String(data: data, encoding: .utf8)!
        headerValue.removeAll { $0 == "\n" } // we can't have newlines in an http header...
        request.setValue(headerValue, forHTTPHeaderField: mobileMonitorPlusHeaderName)
    }
}
