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
    
    //MARK: States
    @State private var productQuantity = 1
    @State private var showAlert = false
    
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
                //                Task {
                //                    do {
                //                        let result =  try await service.sendOrder(product: product)
                //                        switch result {
                //                        case .failure(let error) :
                //                            print(error)
                //                            break
                //
                //                        case .success:
                //                            showAlert = true
                //                            break
                //                        }
                //                    } catch {
                //                        print("Ocorreu um erro")
                //                    }
                //                }
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
        }
    }
}

#Preview {
    ProductDetailView(product: Product(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99))
}
