//
//  CartProducts.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 26/01/24.
//

import Foundation
import Observation

@Observable class CardProducts: Identifiable {
    let id: Int
    let storeName: String
    let storeImage: String
    let storeAddress: String
    var items: [CardItem] = []
    
    init(id: Int, 
         storeName: String,
         storeImage: String,
         storeAddress: String,
         items: [CardItem]) {
        self.id = id
        self.storeName = storeName
        self.storeImage = storeImage
        self.storeAddress = storeAddress
        self.items = items
    }
    
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

@Observable class CardItem: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    var quantity: Int = 0
    
    init(id: Int, 
         name: String,
         description: String,
         image: String,
         price: Double,
         quantity: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.price = price
        self.quantity = quantity
    }
}

