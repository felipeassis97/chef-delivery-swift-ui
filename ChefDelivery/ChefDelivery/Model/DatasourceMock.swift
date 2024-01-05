//
//  DatasourceMock.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 05/01/24.
//

import Foundation

let ordersmock: [OrderType] = [
    OrderType(id: 1, name: "Restaurantes", image: "hamburguer"),
    OrderType(id: 2, name: "Mercado", image: "mercado"),
    OrderType(id: 3, name: "Farmácia", image: "farmacia"),
    OrderType(id: 4, name: "Pet", image: "petshop"),
    OrderType(id: 5, name: "Descontos", image: "descontos"),
    OrderType(id: 6, name: "Bebidas", image: "bebidas"),
    OrderType(id: 7, name: "Gourmet", image: "gourmet"),
]


let banners: [OrderType] = [
    OrderType(id: 1, name: "", image: "barbecue-banner"),
    OrderType(id: 2, name: "", image: "brazilian-meal-banner"),
    OrderType(id: 3, name: "", image: "pokes-banner")
]

let storesMock: [OrderType] = [
    OrderType(id: 1, name: "Monstro Burguer", image: "monstro-burger-logo"),
    OrderType(id: 2, name: "Food Court", image: "food-court-logo"),
    OrderType(id: 3, name: "Carbron", image: "carbron-logo"),
    OrderType(id: 4, name: "Padaria", image: "bakery-logo"),
    OrderType(id: 5, name: "Açai Panda", image: "acai-panda-logo")
]
