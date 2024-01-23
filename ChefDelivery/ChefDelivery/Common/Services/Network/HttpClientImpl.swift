//
//  HttpClientImpl.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 23/01/24.
//

import Foundation

struct HttpClientImpl: HttpClient {
    func get<T: Decodable>(path: String, responseModel: T.Type?) async throws -> Result<T?, HttpClientError> {
        guard let url = URL(string: path) else {
            return .failure(.invalidURL)
        }
        
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...201:
                guard responseModel != nil else {
                    return .success(nil)
                }
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    return .failure(.decodeError)
                }
                return .success(decodedResponse)
                
            case 400...499:
                return .failure(.notFound)
                
            case 500...599:
                return .failure(.badRequest)

            default:
                return .failure(.unknownError(error: "Status code: \(response.statusCode)"))
            }
        }
        catch {
            return .failure(.unknownError(error: "Unknown error: \(error)"))
        }
    }
}
