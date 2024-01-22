//
//  Coordinator.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 19/01/24.
//

import SwiftUI


enum NavigationParameters {
    case productsParams(storeType: StoreType)
}

enum Page: Hashable {
    case initial
    case home
    case products(store: StoreType)
    
    var id: String {
        switch self {
        case .initial:
            return "initial"
            
        case .home:
            return "home"
            
        case .products(let store):
            return "products_\(store.id)"
        }
    }
    
    static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum Sheet: Identifiable {
    case productDetails(product: ProductType)
    
    var id: String {
        switch self {
        case .productDetails:
            return "productDetails"
        }
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
 
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .initial:
            IntroductionView()
        case .home:
            HomeView()
        case .products(let store):
            StoreDetailView(store: store)
        
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .productDetails(let product):
            NavigationStack {
                ProductDetailView(product: product)
            }
        }
    }
}
