//
//  Product.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import Foundation


struct Product: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
    }
}
