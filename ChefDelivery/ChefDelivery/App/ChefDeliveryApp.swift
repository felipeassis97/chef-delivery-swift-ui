//
//  ChefDeliveryApp.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import SwiftUI

@main
struct ChefDeliveryApp: App {
    init() {
        setupServiceLocator()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
