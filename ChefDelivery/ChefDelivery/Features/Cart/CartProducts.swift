//
//  CartProducts.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 26/01/24.
//

import Foundation

struct CardProducts: Identifiable, Codable {
    let id: Int
    let storeName: String
    let storeImage: String
    let storeAddress: String
    var items: [CardItem]
    
   static func factoryCardProducts(store: Store, product: Product, quantity: Int) -> CardProducts {
        return CardProducts(id: store.id, 
                            storeName: store.name, 
                            storeImage: store.logoImage,
                            storeAddress: store.location,
                            items: [
                                CardItem(id: product.id, 
                                         name: product.name,
                                         description: product.description,
                                         image: product.image,
                                         price: product.price, quantity: quantity)
        ])
    }
}

struct CardItem: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    var quantity: Int
}

