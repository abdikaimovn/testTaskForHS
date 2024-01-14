//
//  NetworkService.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

struct NetworkService {
    static let shared = NetworkService()
    func fetchDishes(route: Route, completion: @escaping (Result<ResponseModel, Error>) -> Void) {
        let url = URLSession.shared.createUrlFor(route: route)
        URLSession.shared.request(url: url, expectingType: ResponseModel.self, completion: completion)
    }
}
