//
//  HomeViewModel.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 22/01/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    let service: HttpClient
    
    init(service: HttpClient) {
        self.service = service
    }
    
    //MARK: Categories
    @Published var isLoadingCategories: Bool = true
    @Published var isErrorCategories: Bool = false
    @Published var categories: [Categorie] = []

    //MARK: Banners
    @Published var isLoadingBanners: Bool = true
    @Published var isErrorBanners: Bool = false
    @Published var banners: [Banner] = []
    
    //MARK: Stores
    @Published var isLoadingStores: Bool = true
    @Published var isErrorStores: Bool = false
    @Published var stores: [StoreType] = []
    
    @MainActor
    func getStores() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/stores"
            let storesList = try await service.get(path: url, responseModel: [StoreType].self)
            switch storesList {
            case .failure(_):
                isErrorStores = true
            case .success(let response):
                if response != nil {
                    stores = response!
                }
            }
            isLoadingStores = false
        }
        catch {
            isLoadingStores = false
            isErrorStores = true
        }
    }
    
    @MainActor
    func getCategories() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/categories"
            let categorieList = try await service.get(path: url, responseModel: [Categorie].self)
            switch categorieList {
            case .failure:
                isErrorCategories = true
            case .success(let categorie):
                if categorie != nil {
                    categories = categorie!
                }
            }
            isLoadingCategories = false
        } catch {
            isLoadingCategories = false
            isErrorCategories = true
        }
    }
    
    @MainActor
    func getBanners() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/banners"
            let bannerList = try await service.get(path: url, responseModel: [Banner].self)
            switch bannerList {
            case .failure:
                isErrorBanners = true
            case .success(let banner):
                if banner != nil {
                    banners = banner!
                }
            }
            isLoadingBanners = false
        } catch {
            isLoadingBanners = false
            isErrorBanners = true
        }
    }

}
