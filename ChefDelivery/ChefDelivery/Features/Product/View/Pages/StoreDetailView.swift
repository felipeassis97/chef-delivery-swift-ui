//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import SwiftUI
import Kingfisher

struct StoreDetailView: View {
    //MARK: Atributes
    let store: Store
    
    //MARK: States
    @Environment(\.dismiss) var presentaionMode
    @EnvironmentObject private var coordinator: Coordinator
    @State private var selectedProduct: Product?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                KFImage(URL(string: store.headerImage))
                    .placeholder {
                        Rectangle()
                            .scaledToFill()
                            .frame(height: 100)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    Text(store.name)
                        .font(.customStyle(type: .nunito, style: .bold, size: 24))
                    Spacer()
                    
                    KFImage(URL(string: store.logoImage))
                        .placeholder {
                            Rectangle()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.gray.opacity(0.1))
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack{
                    Text(store.location)
                        .padding(.trailing, 8)
                        .font(.customStyle(type: .nunito, style: .semiBold, size: 16))
                    
                    Spacer()
                    ForEach(1...store.rate, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                Text("Produtos")
                    .font(.customStyle(type: .nunito, style: .bold, size: 20))
                    .padding()
                
                ForEach(store.products) { product in
                    Button(action: {
                        selectedProduct = product
                        // coordinator.present(sheet: .productDetails(product: product))
                    }, label: {
                        ProductItemView(product: product)
                    })
                    .sheet(item: $selectedProduct) { product in
                        ProductDetailView(product: product, store: store)
                    }
                }
            }
            .navigationTitle(store.name)                            
                .font(.customStyle(type: .nunito, style: .semiBold, size: 14))
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(
                        action: {
                            //presentaionMode()
                            coordinator.pop()
                        },
                        label: {
                            HStack(spacing: 4) {
                                Image(systemName: "cart")
                                    .foregroundStyle(.colorRed)
                                
                                Text("Lojas")
                                    .font(.customStyle(type: .nunito, style: .semiBold, size: 16))
                                    .foregroundStyle(.colorRed)
                            }
                        })
                })
            }
        }
    }
}

#Preview {
    StoreDetailView(store: Store(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        rate: 4,
        products: []
    ))
}
