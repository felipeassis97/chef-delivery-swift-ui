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
    
    @Published var isIsLoading: Bool = true
    @Published var isIsLoadingCategories: Bool = true
    @Published var isIsError: Bool = false
    @Published var isIsErrorCategories: Bool = false
    @Published var stores: [StoreType] = []
    @Published var categories: [Categorie] = []
    
    @MainActor
    func getStores() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/stores"
            let storesList = try await service.get(path: url, responseModel: [StoreType].self)
            switch storesList {
            case .failure(_):
               isIsError = true
            case .success(let response):
                if response != nil {
                    stores = response!
                }
            }
            isIsLoading = false
        }
        catch {
            isIsLoading = false
            isIsError = true
        }
    }
    
    @MainActor
    func getCategories() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/categories"
            let categorieList = try await service.get(path: url, responseModel: [Categorie].self)
            switch categorieList {
            case .failure:
                isIsError = true
            case .success(let categorie):
                if categorie != nil {
                    categories = categorie!
                }
            }
            isIsLoadingCategories = false
        } catch {
            isIsLoadingCategories = false
            isIsErrorCategories = true
        }
    }

}
