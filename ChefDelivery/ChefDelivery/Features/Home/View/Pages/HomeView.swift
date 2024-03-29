//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 21/01/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = sl.getService()!
    var cartViewModel: CartViewModel = sl.getService()!
    @State private var showModal: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            
            VStack(spacing: 16) {
                if viewModel.isLoadingStores {
                    ProgressView()
                } else  {
                    NavigationBar()
                        .padding(.horizontal, 8)
                    ScrollView(.vertical, showsIndicators: false) {
                        CategoriesGridView(categories: viewModel.categories)
                        PromotionalBannerTabView(banners: viewModel.banners)
                            .padding(.top, 16)
                        StoresListView(stores: viewModel.stores)
                            .padding(.top, 16)
                    }
                }
            }
            
            if cartViewModel.hasItems {
                Button(action: {
                    print("Carrinho")
                    showModal = true
                }, label: {
                    ZStack(alignment: .center) {
                        Circle()
                            .frame(height: 64)
                            .foregroundStyle(.colorRed)
                        
                        Image(systemName: "cart.fill")
                            .foregroundStyle(.white)
                            .font(.title2)
                    }
                    .padding(.trailing, 4)
                })
                .sheet(isPresented: $showModal, content: {
                    CartView()
                })
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await viewModel.getCategories()
                await viewModel.getStores()
                await viewModel.getBanners()
            }
        }
    }
}

#Preview {
    HomeView()
}
