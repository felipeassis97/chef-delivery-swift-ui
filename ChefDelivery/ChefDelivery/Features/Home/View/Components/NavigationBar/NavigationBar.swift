//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("Av. Paulista, 154") {
                print("Address")
            }
            .font(.customStyle(type: .nunito, style: .bold, size: 16))
            .foregroundColor(.black)

            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundStyle(.red)
            })
        }
    }
}

#Preview {
    NavigationBar()
}
