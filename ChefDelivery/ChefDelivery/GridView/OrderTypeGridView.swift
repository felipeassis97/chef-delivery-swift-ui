//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct OrderTypeGridView: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 16) {
            ForEach(ordersmock) {
                categorie in
                OrderTypeItemView(orderItem: categorie)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

#Preview {
    OrderTypeGridView()
}
