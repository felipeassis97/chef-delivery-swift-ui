//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import Foundation


struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let rate: Int
    let products: [ProductType]
}
