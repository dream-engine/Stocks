//
//  NetworkManager.swift
//  Stocks
//
//  Created by Mohit Kumar Singh on 16/03/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
}

extension NetworkManager {
    func getData<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = endpoint.headers
        
        if let parameters = endpoint.parameters {
            request.url = URL(string: request.url!.absoluteString + "?" + parameters.queryString)
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    func postData<T: Decodable>(from endpoint: Endpoint, body: Data) async throws -> T {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = body
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
