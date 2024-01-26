//
//  CartView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 26/01/24.
//

import SwiftUI
import Kingfisher

struct CartView: View {
    @StateObject var cartViewModel: CartViewModel = sl.getService()!

    var body: some View {
        ScrollView {
            VStack {
                StoreInfoView(store: cartViewModel.cartItems!)
                
                ForEach(cartViewModel.cartItems!.items) { item in
                    CardItemView(product: item)
                }
            }
        }
    }
}


struct StoreInfoView: View {
    let store: CardProducts
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            StoreImageView(imageURL: store.storeImage)
            
            VStack( alignment: .leading, spacing: 8) {
                Text(store.storeName)
                    .font(.customStyle(type: .nunito, style: .bold, size: 18))
                Text(store.storeAddress)
                    .font(.customStyle(type: .nunito, style: .semiBold, size: 14))
                    .foregroundStyle(.gray)
            }
        Spacer()
            Image(systemName: "heart.fill")
                .font(.title2)
                .foregroundStyle(.colorRed)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
    }
}

struct CardItemView: View {
    let product: CardItem
    
    var body: some View {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: .infinity, height: 104)
                        .foregroundStyle(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                        .shadow(color: .gray.opacity(0.1), radius: 8, x: 2, y: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                
                HStack {
                    ItemImageView(imageURL: product.image)
                    ItemInfosView(item: product)
                    Spacer()
                    QuantityItemView()
                }
            }
    }
}

struct ItemImageView: View {
    let imageURL: String
    
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder({ _ in
                Rectangle()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 64, height: 64)
                    .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
                    .foregroundStyle(.gray.opacity(0.1))
            })
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(width: 64, height: 64)
            .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
            .padding(.leading, 24)
    }
}

struct StoreImageView: View {
    let imageURL: String
    
    var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder({ _ in
                Rectangle()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 64, height: 64)
                    .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
                    .foregroundStyle(.gray.opacity(0.1))
            })
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(width: 64, height: 64)
            .shadow(color:.black.opacity(0.3), radius: 20, x: 6, y: 8)
    }
}

struct ItemInfosView: View {
    let item: CardItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.customStyle(type: .nunito, style: .bold, size: 16))
            
            Text(item.description)
                .font(.customStyle(type: .nunito, style: .semiBold, size: 14))
                .foregroundStyle(.gray)
                .lineLimit(1)
                .padding(.bottom, 2)

            Text(item.price.formatPrice())
                .font(.customStyle(type: .nunito, style: .bold, size: 20))
                .foregroundStyle(.colorRed)
        }
        .padding(.all, 8)
    }
}

struct QuantityItemView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "minus.circle.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
            })
            
            Text("1")
                .font(.customStyle(type: .nunito, style: .bold, size: 16))
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus.circle.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
            })
        }
        .padding(.trailing, 24)
    }
}

#Preview {
    CartView()
}
