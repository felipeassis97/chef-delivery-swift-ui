//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.dismiss) var presentaionMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    Text(store.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(store.logoImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack{
                    Text(store.location)
                        .padding(.trailing, 8)
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
                    .font(.title2)
                    .bold()
                    .padding()
                
                
                ForEach(store.products) { product in
                   /* NavigationLink(
                        destination:{
                        ProductDetailView(product: product)
                    }, label: {
                        ProductItemView(product: product)
                    })*/
                    
                    Button(action: {
                        selectedProduct = product
                    }, label: {
                        ProductItemView(product: product)

                    }).sheet(item: $selectedProduct) { product in
                        ProductDetailView(product: product)
                    }
                }
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(
                        action: {
                            presentaionMode()
                            // presentaionMode.callAsFunction()
                        },
                        label: {
                            HStack(spacing: 4) {
                                Image(systemName: "cart").foregroundStyle(Color("ColorRed"))
                                Text("Lojas").foregroundStyle(.red)
                            }
                    })
                })
            }
        }
    }
}

#Preview {
    StoreDetailView(store: StoreType(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        rate: 4,
        products: []
    ))
}
