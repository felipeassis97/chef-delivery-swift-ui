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
    StoresListView(stores: storesMock)
}
