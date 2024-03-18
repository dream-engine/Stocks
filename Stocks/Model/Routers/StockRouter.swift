//
//  StockRouter.swift
//  Stocks
//
//  Created by Mohit Kumar Singh on 16/03/24.
//

import Foundation

struct StockEndPoint: Endpoint {
    var url: URL
    
    var headers: [String : String]?
    
    var parameters: [String : Any]?
    
    
}

enum StockRouter: BaseRouter {
    case getStocks
    
    
    var method: HTTPMethod {
        switch self {
        case .getStocks:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getStocks:
            return ""
        }
    }
    
    var params: [String : Any] {
        switch self {
        case .getStocks:
            return [:]
        }
    }
    
}
