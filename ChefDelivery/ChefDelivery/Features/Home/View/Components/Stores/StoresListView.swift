//
//  StoresListView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct StoresListView: View {
    //MARK: Atributes
    var stores: [StoreType]
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.rate >= rateFilter
        }
    }
    
    //MARK: States
    @EnvironmentObject private var coordinator: Coordinator
    @State private var rateFilter = 0
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Lojas")
                    .font(.customStyle(type: .nunito, style: .bold, size: 16))
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                
                Spacer()
                
                Menu("Filtrar") {
                    Button(action: {
                        rateFilter = 0
                    }, label: {
                        Text("Limpar Filtro")
                            .font(.customStyle(type: .nunito, style: .bold, size: 12))
                    })
                    Divider()
                    ForEach(1...5, id: \.self) { rate in
                        Button(action: {
                            rateFilter = rate
                        }, label: {
                            rate > 1 ?
                            Text("\(rate) estrelas ou mais") :
                            Text("\(rate) estrela ou mais")
                        })
                        .font(.customStyle(type: .nunito, style: .semiBold, size: 10))
                    }
                }
                .foregroundStyle(.black)
                .padding(.trailing)
                .font(.customStyle(type: .nunito, style: .bold, size: 16))
            }
            
            if(filteredStores.isEmpty) {
                VStack(alignment: .center, spacing: 16) {
                    Image("EmptyState")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top, 32)
                    
                    Text("Nenhuma loja encontrada")
                        .font(.customStyle(type: .nunito, style: .bold, size: 20))
                    
                }
            } else {
                List(filteredStores) { store in
                    Button(action: {
                        coordinator.push(.products(store: store))
                    }, label: {
                        StoreItemView(orderItem: store)
                    })
                }
                .scrollDisabled(true)
                .scrollContentBackground(.hidden)
                .scaledToFit()
                .listStyle(.plain)
                .foregroundStyle(.black)
                .listRowSeparator(.hidden)
            }
        }
        
    }
}

#Preview {
    StoresListView(stores:[
        StoreType(
            id: 1,
            name: "Monstro Burger",
            logoImage: "monstro-burger-logo",
            headerImage: "monstro-burger-header",
            location: "Rua Principal, 123, São Paulo, SP",
            rate: 4,
            products: [
                ProductType(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99),
                ProductType(id: 2, name: "Hambúrguer com Bacon", description: "Hambúrguer de carne com queijo, bacon crocante, alface e tomate", image: "bacon_burger", price: 16.99),
                ProductType(id: 3, name: "Batatas Fritas", description: "Porção de batatas fritas crocantes", image: "fries", price: 5.99),
                ProductType(id: 4, name: "Refrigerante", description: "Lata de refrigerante de 355ml", image: "soda", price: 3.99),
                ProductType(id: 5, name: "Sorvete de Baunilha", description: "Copo de sorvete de baunilha", image: "vanilla_ice_cream", price: 4.99)
            ]
        )]
    )
}
