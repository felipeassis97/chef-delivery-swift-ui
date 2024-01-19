//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import Foundation


struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let rate: Int
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, products
        case logoImage = "logo_image"
        case headerImage = "header_image"
        case rate = "stars"
    }
}
