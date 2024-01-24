//
//  CategoriesGridView.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

struct CategoriesGridView: View {
    //MARK: Atributes
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    }
    
    @StateObject var viewModel: HomeViewModel = sl.getService()!
    let categories: [Categorie]
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 16) {
            if viewModel.isLoadingStores {
                LoadingCategoriesView()
            } else if viewModel.isErrorCategories {
                ErrorCategoriesView()
            } else {
                ForEach(categories) { categorie in
                    CategoryItemView(categorie: categorie)
                }
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

struct LoadingCategoriesView : View {
    var body: some View {
        ForEach(0...6, id: \.self) { _ in
            Rectangle()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .foregroundStyle(.gray.opacity(0.1))
                .frame(width: 70, height: 70)
        }
    }
}

struct ErrorCategoriesView : View {
    var body: some View {
        Text("Ocorreu um erro ao carregar as categorias")
    }
}

#Preview {
    CategoriesGridView(categories: [])
}
