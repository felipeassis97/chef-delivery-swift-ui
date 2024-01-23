//
//  HomeViewModel.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 22/01/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    let service: NetworkService2
    
    init(service: NetworkService2) {
        self.service = service
    }
    
    @Published var isIsLoading: Bool = true
    @Published var isIsError: Bool = false
    @Published var stores: [StoreType] = []
    
    @MainActor
    func getStores() async {
        do {
            let url = "https://private-c9da9-felipeassis.apiary-mock.com/home"
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

}
