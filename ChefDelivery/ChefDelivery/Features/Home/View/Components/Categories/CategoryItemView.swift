//
//  OrderTypeItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI
import Kingfisher

struct CategoryItemView: View {

    //MARK: Atributes
    let categorie: Categorie
    
    var body: some View {
        VStack(spacing: 5) {
            KFImage(URL(string: categorie.thumb))
                .placeholder {
                    Rectangle()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .foregroundStyle(.gray.opacity(0.1))
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text(categorie.name)
                .font(.customStyle(type: .nunito, style: .medium, size: 10))
        }
        .frame(width: 70, height: 100)
    }
}

#Preview {
    CategoryItemView(categorie: Categorie(id: 1, name: "Restaurantes", thumb: "hamburguer"))
}
