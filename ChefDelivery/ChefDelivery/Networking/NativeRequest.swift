//
//  NativeRequest.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 08/01/24.
//

import Foundation
struct NativeRequest {
    
// MARK: v1
   /* func fetchData() {
        guard let url = URL(string: "https://private-c9da9-felipeassis.apiary-mock.com/home") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    let obj = try JSONDecoder().decode([StoreType].self, from: data)
                    print(obj)
                } catch {
                    print("Decode error")
                    return
                }
            }
        }.resume()
    }
 */
    
// MARK: v2
    enum RequestError: Error {
        case invalidURL
        case decodeError
        case requestError(error: String)
    }
    
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
            return .success("Success")
        }
        catch {
            return .failure(.requestError(error: "Error na request"))
        }
    }
}
