//
//  HttpErrorType.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 23/01/24.
//

import Foundation

enum HttpClientError: Error {
    case invalidURL
    case decodeError
    case noResponse
    case notFound
    case badRequest
    case unknownError(error: String)
    case requestError(error: String)
}
