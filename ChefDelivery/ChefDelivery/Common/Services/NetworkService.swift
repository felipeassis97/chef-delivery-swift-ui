//
//  NativeRequest.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 08/01/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case decodeError
    case noResponse
    case notFound
    case badRequest
    case unknownError(error: String)
    case requestError(error: String)
}

protocol NetworkService2 {
    func get<T: Decodable>(path: String, responseModel: T.Type?) async throws -> Result<T?, RequestError>
}

struct NetworkServiceImpl: NetworkService2 {
    func get<T: Decodable>(path: String, responseModel: T.Type?) async throws -> Result<T?, RequestError> {
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







struct NetworkService {
    
// MARK: Alamofire implementation
    func fetchDataAlamofire(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request("https://private-c9da9-felipeassis.apiary-mock.com/home").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
        }
        
    }
    
    func sendOrderAlamofire(  product: ProductType, completion: @escaping (String?, Error?) -> Void) {
        AF.request("https://private-c9da9-felipeassis.apiary-mock.com/home", method: .post).responseDecodable(of: String.self) { response in
            switch response.result {
            case .success(let message):
                completion(message, nil)
            default: break
            }
        }
    }
    
// MARK: Native implementation

    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-c9da9-felipeassis.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
       var request = URLRequest(url: url)
       request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let stores = try JSONDecoder().decode([StoreType].self, from: data)
            return .success(stores)
        }
        catch {
            return .failure(.requestError(error: "Error na request"))
        }
     }
    
    func sendOrder(product: ProductType) async throws -> Result<String?, RequestError> {
        guard let url = URL(string: "https://private-c9da9-felipeassis.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
        
        do {
            let encodeProduct = try JSONEncoder().encode(product)
            request.httpBody = encodeProduct
            let (data, _) = try await URLSession.shared.data(for: request)
            return .success("Success: \(data)")
        }
        catch {
            return .failure(.requestError(error: "Error na request"))
        }
    }
}
