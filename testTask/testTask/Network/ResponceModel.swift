//
//  ResponceModel.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

struct ResultForRoute {
    let forRoute: Route
    let result: [DishModel]
}

struct ResponseModel: Decodable {
    let results: [DishModel]
    let offset: Int
    let number: Int
    let totalResults: Int
}

struct DishModel: Decodable {
    let id: Int
    let title: String
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imagePath = "image"
    }
}
