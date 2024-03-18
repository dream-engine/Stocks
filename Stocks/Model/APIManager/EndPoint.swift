//
//  EndPoint.swift
//  Stocks
//
//  Created by Mohit Kumar Singh on 16/03/24.
//

import Foundation

protocol Endpoint {
    var url: URL { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension Dictionary {
    var queryString: String {
        return self.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
    }
}
