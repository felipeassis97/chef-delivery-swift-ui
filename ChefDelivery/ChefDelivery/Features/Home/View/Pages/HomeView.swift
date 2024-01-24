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
