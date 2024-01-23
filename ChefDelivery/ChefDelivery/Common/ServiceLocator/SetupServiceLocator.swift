//
//  SetupServiceLocator.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 22/01/24.
//

import Foundation

let sl = LazyServiceLocator()

 func setupServiceLocator() {
    sl.addService(instance: NetworkServiceImpl() as NetworkService2)
    sl.addService(instance: HomeViewModel(service: sl.getService()! as NetworkService2) as HomeViewModel)
}
