//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct StoreItemView: View {
    var orderItem: OrderType
    
    var body: some View {
        HStack {
            Image(orderItem.image)
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 40, height: 40)
            
            Text(orderItem.name)
                .font(.subheadline)
        }
        .onTapGesture {
            print("Click item: \(orderItem.name)")
        }
    }
}

#Preview {
    StoreItemView(orderItem: OrderType(id: 1, name: "Food court", image: "fraldinha"))
}
