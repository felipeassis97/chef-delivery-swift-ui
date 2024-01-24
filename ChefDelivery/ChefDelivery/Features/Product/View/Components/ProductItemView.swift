//
//  ProductItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import SwiftUI

struct ProductItemView: View {
    //MARK: Atributes
    let product: Product
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                    .foregroundStyle(.black)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.5))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Text(product.formattedPrice)
                    .foregroundStyle(.black)

            }
            Spacer()
            Image(product.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 120, height: 120)
                .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
        }.padding()
    }
}

#Preview {
    ProductItemView(product: Product(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99))
}
