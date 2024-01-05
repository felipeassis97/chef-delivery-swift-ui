//
//  CarrousselTabView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CarrousselTabView: View {
    var body: some View {
        TabView {
            ForEach(banners) {
                item in
                CarrousselItemView(orderItem: item)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: 180)
        
    }
}

#Preview {
    CarrousselTabView()
}
