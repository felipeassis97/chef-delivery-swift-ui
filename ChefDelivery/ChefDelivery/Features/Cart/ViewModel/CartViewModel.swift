//
//  CartViewModel.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 25/01/24.
//

import Foundation


class CartViewModel: ObservableObject {
    @Published var hasItems = false
    
    func changeHasItems(newValue: Bool) {
        hasItems = newValue
    }
}
