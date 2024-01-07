//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationBar()
                    .padding(.horizontal, 8)
                
                ScrollView(.vertical, showsIndicators: false) {
                    OrderTypeGridView()
                    
                    CarrousselTabView()
                        .padding(.top, 16)
                    
                    StoresListView()
                        .padding(.top, 16)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
