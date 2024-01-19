//
//  StoresListView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct StoresListView: View {
    
    @State private var rateFilter = 0
    
    var stores: [StoreType]
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.rate >= rateFilter
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Lojas")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                
                Spacer()
                
                Menu("Filtrar") {
                    Button(action: {
                        rateFilter = 0
                    }, label: {
                        Text("Limpar Filtro")
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
                    }
                }
                .foregroundStyle(.black)
                .padding(.trailing)
                
            }
            
            if(filteredStores.isEmpty) {
                VStack(alignment: .center, spacing: 16) {
                    Image("EmptyState")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 32)
                    
                    Text("Nenhma loja encontrada")
                }
            } else {
                List(filteredStores) { store in
                    NavigationLink(destination: {
                        StoreDetailView(store: store)
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
