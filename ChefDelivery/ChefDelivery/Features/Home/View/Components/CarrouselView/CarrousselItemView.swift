//
//  CarrousselItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CarrousselItemView: View {
    //MARK: Atributes
    let orderItem: OrderType
    
    var body: some View {
        Image(orderItem.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CarrousselItemView(orderItem:  OrderType(id: 1, name: "Restaurantes", image: "barbecue-banner"))
}
