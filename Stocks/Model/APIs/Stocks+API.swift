//
//  Stocks+API.swift
//  Stocks
//
//  Created by Mohit Kumar Singh on 16/03/24.
//

import Foundation

extension Stock {
    
    static func getStocks() async throws -> [Stock] {
        let stockEndPoint = StockEndPoint(url: URL(string: "https://api.upstox.com/v2")!,
                                          headers: ["Authorization": "Bearer "],
                                          parameters: nil)
        do {
            let stocks: [Stock] = try await NetworkManager.shared.getData(from: stockEndPoint)
            return stocks
        } catch {
            throw error
        }
    }
}
