//
//  OrderTypeItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct OrderTypeItemView: View {
    //MARK: Atributes
    let orderItem: OrderType
    
    var body: some View {
        VStack(spacing: 5) {
            Image(orderItem.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text(orderItem.name)
                .font(.system(size: 10))
        }
        .frame(width: 70, height: 100)
    }
}

#Preview {
    OrderTypeItemView(orderItem: OrderType(id: 1, name: "Restaurantes", image: "hamburguer"))
}
