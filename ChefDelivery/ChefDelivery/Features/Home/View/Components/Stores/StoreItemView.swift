//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct StoreItemView: View {
    var orderItem: StoreType
    
    var body: some View {
        HStack {
            Image(orderItem.logoImage)
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 40, height: 40)
            
            Text(orderItem.name)
                .font(.subheadline)
        }
    }
}

#Preview {
    StoreItemView(orderItem: StoreType(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        rate: 4,
        products: []
    ))
}
