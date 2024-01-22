//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 21/01/24.
//

import SwiftUI

struct HomeView: View {
    private let service = NetworkService()
    
    @State private var homeStores: [StoreType] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
            VStack(spacing: 16) {
                
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 8)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        OrderTypeGridView()
                        
                        CarrousselTabView()
                            .padding(.top, 16)
                        
                        StoresListView(stores: homeStores)
                            .padding(.top, 16)
                }

                }
            }
            .padding()
            .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                isLoading = true
                await  getStores()
                isLoading = false
            }
            
            getStoresAlamofire()
        }
    }
    
    
    func getStoresAlamofire() {
        service.fetchDataAlamofire { stores, error in
            print("ALAMOFIRE: \(String(describing: stores))")
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
             homeStores = stores
            case .failure(let error):
                print(error)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

#Preview {
    HomeView()
}
