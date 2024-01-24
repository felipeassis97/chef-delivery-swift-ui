//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct StoreItemView: View {
    //MARK: States
    @State private var image: UIImage?
    
    //MARK: Atributes
    var orderItem: Store
    let downloadImage = DownloadImageService()
    
    var body: some View {
        HStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 40, height: 40)
            } else {
                Circle()
                    .scaledToFit()
                    .foregroundStyle(.gray.opacity(0.1))
                    .frame(width: 40, height: 40)
            }
            Text(orderItem.name)
                .font(.customStyle(type: .nunito, style: .regular, size: 14))
                .padding(.leading, 4)

        }.onAppear {
            Task {
                image = try? await downloadImage.dowloadImage(from: orderItem.logoImage)
            }
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
