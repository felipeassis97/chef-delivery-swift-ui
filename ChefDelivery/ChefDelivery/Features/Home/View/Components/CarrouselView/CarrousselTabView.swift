//
//  CarrousselTabView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CarrousselTabView: View {
    @State private var currentCarrousselIndex = 1
    
    var body: some View {
        TabView(selection: $currentCarrousselIndex) {
            ForEach(banners) {
                item in
                CarrousselItemView(orderItem: item)
                    .tag(item.id)
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

#Preview {
    CarrousselTabView()
}
