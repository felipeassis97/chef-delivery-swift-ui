//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 06/01/24.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    //MARK: Atributes
    let product: Product
    let store: Store
    
    //MARK: States
    @State private var productQuantity = 1
    @State private var showAlert = false
    @StateObject var viewModel: CartViewModel = sl.getService()!
    @Environment(\.dismiss) var presentaionMode
    @EnvironmentObject private var coordinator: Coordinator


    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                KFImage(URL(string: product.image))
                    .placeholder {
                        Rectangle()
                            .shadow(radius: 16.0)
                            .scaledToFill()
                            .frame(height: 100)
                            .foregroundStyle(.gray.opacity(0.1))
                    }
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 16.0)
                
                Text(product.name)
                    .font(.customStyle(type: .nunito, style: .bold, size: 24))
                    .padding(.horizontal)
                
                Text(product.description)
                    .font(.customStyle(type: .nunito, style: .regular, size: 18))
                    .foregroundStyle(.black.opacity(0.7))
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.customStyle(type: .nunito, style: .bold, size: 20))
                    .padding(.horizontal)
            }
            
            Spacer()
            
            VStack {
                Text("Quantidade")
                    .font(.customStyle(type: .nunito, style: .bold, size: 20))

                HStack {
                    Button(action: {
                        if(productQuantity != 0) {
                            productQuantity -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                    })
                    
                    Text("\(productQuantity)")
                        .font(.customStyle(type: .nunito, style: .bold, size: 18))

                    Button(action: {
                        productQuantity += 1
                        
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                    })
                }
            }
            Spacer()
            Button(action:{
                
                if viewModel.cartItems != nil && viewModel.cartItems?.id != store.id {
                    showAlert = true
                } else {
                    viewModel.addItem(item: CardProducts.factoryCardProducts(
                        store: store, product: product, quantity: 1))
                    coordinator.pop()
                }
            }, label: {
                HStack(spacing: 8) {
                    Image(systemName: "cart")
                    Text("Adicionar ao carrinho")
                        .font(.customStyle(type: .nunito, style: .regular, size: 16))
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .background(.colorRed)
            })
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 16)
            .alert("Atenção", isPresented: $showAlert, actions: {
                Button {
                    viewModel.clearCart()
                    viewModel.addItem(item: CardProducts.factoryCardProducts(
                        store: store, product: product, quantity: 1))
                    coordinator.pop()
                } label: {
                    Text("Limpar carrinho e adicionar")
                }
                .font(.customStyle(type: .nunito, style: .bold, size: 16))
                .foregroundStyle(.colorRed)

            }, message: {
                Text("Você já tem produtos de outra loja em seu carrinho. Deseja limpar o carrinho atual e adicionar o novo produto?")

            })
            

        }
    }
}

#Preview {
    ProductDetailView(product: Product(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99), store: Store(
        id: 1,
        name: "Monstro Burger",
        logoImage: "monstro-burger-logo",
        headerImage: "monstro-burger-header",
        location: "Rua Principal, 123, São Paulo, SP",
        rate: 4,
        products: []
    ))
}
