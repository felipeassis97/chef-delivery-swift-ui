//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 21/01/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = sl.getService()!
    
    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isIsLoading {
                ProgressView()
            } else if viewModel.isIsError {
                
                VStack(alignment: .center, spacing: 16) {
                    Text("Ocorreu um erro! Por favor, tente novamente.")
                        .frame(width: .infinity, height: .infinity)
                        .foregroundStyle(.colorRedVariant)
                    Button(action: {
                        Task {
                            await viewModel.getStores()
                        }
                    }, label: {
                        HStack {
                            Text("Tentar novamente")
                                .padding()
                                .font(.title3)
                                .foregroundStyle(.colorRedVariant)
                            
                            Image(systemName: "arrow.clockwise")
                                .font(.title3)
                                .foregroundStyle(.colorRedVariant)
                        }
                    })
                }
             
            }
            else {
                NavigationBar()
                    .padding(.horizontal, 8)
                ScrollView(.vertical, showsIndicators: false) {
                    OrderTypeGridView()
                    CarrousselTabView()
                        .padding(.top, 16)
                    StoresListView(stores: viewModel.stores)
                        .padding(.top, 16)
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.getStores()
            }
        }
    }
}

#Preview {
    HomeView()
}
