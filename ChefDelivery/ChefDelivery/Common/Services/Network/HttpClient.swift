//
//  HttpClient.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 23/01/24.
//

import Foundation

protocol HttpClient {
    func get<T: Decodable>(path: String, responseModel: T.Type?) async throws -> Result<T?, HttpClientError>
}
