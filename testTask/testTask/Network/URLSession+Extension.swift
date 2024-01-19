//
//  URLSession+Extension.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

extension URLSession {
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Decodable>(url: URL?,
                            expectingType: T.Type,
                            completion: @escaping ((Result<T, Error>) -> Void) )
    {
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expectingType, from: data)
                completion(.success(result))
            } catch (let error) {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    func createUrlFor(route: Route) -> URL? {
        let baseUrl = Route.baseUrl
        let apiKey = AppConfig.apiKey
        return URL(string: "\(baseUrl)\(route)&apiKey=\(apiKey)")
    }
}

