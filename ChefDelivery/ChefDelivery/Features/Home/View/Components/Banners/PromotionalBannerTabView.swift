//
//  PromotionalBannerTabView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct PromotionalBannerTabView: View {
    //MARK: Atributes
    let banners: [Banner]
    
    //MARK: States
    @State private var currentCarrousselIndex = 1
    @StateObject var viewModel: HomeViewModel = sl.getService()!
    
    var body: some View {
        TabView(selection: $currentCarrousselIndex) {
            if viewModel.isLoadingBanners {
                LoadingBannersView()
            } else if viewModel.isErrorBanners {
                ErrorBannersView()
            }
            else {
                ForEach(banners) { banner in
                    PromotionalBannerItemView(banner: banner)
                        .tag(banner.id)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: 180)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    if currentCarrousselIndex > banners.count {
                        currentCarrousselIndex = 1
                    }
                    currentCarrousselIndex += 1
                }
            }
        }
    }
}

struct LoadingBannersView : View {
    var body: some View {
        ForEach(0...2, id: \.self) { _ in
            Rectangle()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .foregroundStyle(.gray.opacity(0.1))
                .padding(.horizontal, 24)
        }
    }
}

struct ErrorBannersView : View {
    var body: some View {
        Rectangle()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(.red.opacity(0.1))
            .padding(.horizontal, 24)
    }
}

#Preview {
    PromotionalBannerTabView(banners: [])
}
