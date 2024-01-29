//
//  CartViewModel.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 25/01/24.
//

import Foundation


@Observable class CartViewModel {
    var cartItems: CardProducts?
    var hasItems: Bool = false
    var amountCart: Double = 0.0
    var deliveryFee: Double = 10.0
    
    var total: Double {
        return amountCart + deliveryFee
    }
    
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
        checkAmountCart()
    }
    
    func changeQuantityItem(productId: Int, type: ChangeItemType) {
        cartItems?.items.forEach({ item in
            if item.id == productId {
                switch type {
                case .decrement:
                    item.quantity -= 1
                case .increment:
                    item.quantity += 1
                }
            }
        })
        checkAmountCart()
    }
    
    func clearCart() {
        cartItems = nil
        checkAmountCart()
        changeHasItems(newValue: false)
    }
    
    func checkAmountCart() {
        if cartItems == nil || (cartItems?.items.count)! <= 0 {
            amountCart = 0.0
        } else {
            var currentValue: Double = 0.0
            cartItems?.items.forEach({ item in
                let amountItem = Double(item.quantity) * item.price
                currentValue += amountItem
            })
            amountCart = currentValue
        }
        print(amountCart.formatPrice())
    }
}


enum ChangeItemType {
    case increment
    case decrement
}
