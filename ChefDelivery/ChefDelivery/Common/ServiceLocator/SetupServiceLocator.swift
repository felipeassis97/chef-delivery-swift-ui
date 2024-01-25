//
//  SetupServiceLocator.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 22/01/24.
//

import Foundation

let sl = LazyServiceLocator()

 func setupServiceLocator() {
    sl.addService(instance: HttpClientImpl() as HttpClient)
    sl.addService(instance: HomeViewModel(service: sl.getService()! as HttpClient) as HomeViewModel)
    sl.addService(instance: CartViewModel())
}
