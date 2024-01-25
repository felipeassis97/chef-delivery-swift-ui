//
//  ProductItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    //MARK: Atributes
    let product: Product

    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.customStyle(type: .nunito, style: .semiBold, size: 16))
                    .foregroundStyle(.black)
                
                Text(product.description)
                    .font(.customStyle(type: .nunito, style: .regular, size: 16))
                    .foregroundStyle(.black.opacity(0.5))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Text(product.formattedPrice)
                    .font(.customStyle(type: .nunito, style: .semiBold, size: 16))
                    .foregroundStyle(.black)
            }
            Spacer()
            KFImage(URL(string: product.image))
                .placeholder({ _ in
                    Rectangle()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 120, height: 120)
                        .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
                        .foregroundStyle(.gray.opacity(0.1))
                })
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: 120, height: 120)
                .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
    }
}

#Preview {
    ProductItemView(product: Product(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99))
}
