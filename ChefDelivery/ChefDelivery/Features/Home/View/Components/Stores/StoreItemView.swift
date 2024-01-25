//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI
import Kingfisher

struct StoreItemView: View {
    
    //MARK: Atributes
    var orderItem: Store
    
    var body: some View {
        HStack {
            KFImage(URL(string: orderItem.logoImage))
                .placeholder({ _ in
                    Circle()
                        .scaledToFit()
                        .foregroundStyle(.gray.opacity(0.1))
                        .frame(width: 40, height: 40)
                })
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 40, height: 40)
            
            Text(orderItem.name)
                .font(.customStyle(type: .nunito, style: .regular, size: 14))
                .padding(.leading, 4)
        }
    }
}

#Preview {
    StoreItemView(orderItem: Store(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        rate: 4,
        products: []
    ))
}
