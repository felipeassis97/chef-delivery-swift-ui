//
//  CartViewModel.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 25/01/24.
//

import Foundation


class CartViewModel: ObservableObject {
    @Published var cartItems: CardProducts?
    @Published var hasItems = false
    
    func changeHasItems(newValue: Bool) {
        hasItems = newValue
    }
    
    func addItem(item: CardProducts) {
        if cartItems != nil {
            cartItems?.items.append(contentsOf: item.items)
        } else {
            cartItems = item
        }
        changeHasItems(newValue: true)
        
        print(cartItems)
    }
    
    func clearCart() {
        cartItems = nil
        changeHasItems(newValue: false)
    }
}
