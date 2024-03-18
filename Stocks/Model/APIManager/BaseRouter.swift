//
//  BaseRouter.swift
//  Stocks
//
//  Created by Mohit Kumar Singh on 16/03/24.
//

import Foundation

public protocol URLRequestConvertible {
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    func asURLRequest() throws -> URLRequest
}

public protocol Router {
    var method: HTTPMethod { get }
    var path: String { get }
    var params: [String: Any] { get }
    var baseUrl: URL { get }
    var headers: [String: String] { get }
//    var encoding: URLEncoding? { get }
    var timeoutInterval: TimeInterval? { get }
    var keypathToMap: String? { get }
}

public protocol BaseRouter: Router {
    
}
public let defaultPerPage = 20

extension BaseRouter {
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return ""
    }
    
    public var params: [String: Any] {
        return [:]
    }
    
    // use API url
    public var baseUrl: URL {
        return URL(string: "")!
    }
    
    public var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    public var timeoutInterval: TimeInterval? {
        return nil
    }
    
    public var keypathToMap: String? {
        return nil
    }
    
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}
