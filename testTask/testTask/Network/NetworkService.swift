//
//  NetworkService.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    // Запрос извлекающий список данных для всех видов route
    func fetchDishes(routes: [Route], completion: @escaping (Result<[ResultForRoute], Error>) -> Void) {
        var results = [ResultForRoute]()
        let dispatchGroup = DispatchGroup()

        for route in routes {
            dispatchGroup.enter()

            let url = URLSession.shared.createUrlFor(route: route)
            URLSession.shared.request(url: url, expectingType: ResponseModel.self) { result in
                switch result {
                case .success(let responseModel):
                    let resultForRoute = ResultForRoute(forRoute: route, result: responseModel.results)
                    results.append(resultForRoute)
                case .failure(let error):
                    completion(.failure(error))
                    break
                }

                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(results))
        }
    }
}

