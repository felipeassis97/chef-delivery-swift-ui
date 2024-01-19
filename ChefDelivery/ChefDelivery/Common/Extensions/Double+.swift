//
//  Double+.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formatterString = String(format: "%.2f", self)
        return formatterString.replacingOccurrences(of: ".", with: ",")
    }
}
