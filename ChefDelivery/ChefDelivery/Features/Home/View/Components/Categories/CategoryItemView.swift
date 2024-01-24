//
//  OrderTypeItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CategoryItemView: View {
    //MARK: States
    @State private var image: UIImage?
    
    //MARK: Atributes
    let downloadImage = DownloadImageService()
    let categorie: Categorie
    
    var body: some View {
        VStack(spacing: 5) {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            } else {
                Rectangle()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .foregroundStyle(.gray.opacity(0.1))
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            
            Text(categorie.name)
                .font(.customStyle(type: .nunito, style: .medium, size: 10))
        }
        .frame(width: 70, height: 100)
        .onAppear {
            Task {
                image = try? await downloadImage.dowloadImage(from: categorie.thumb)
            }
        }
    }
}

#Preview {
    CategoryItemView(categorie: Categorie(id: 1, name: "Restaurantes", thumb: "hamburguer"))
}
