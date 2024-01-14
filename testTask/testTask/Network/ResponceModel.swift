//
//  ResponceModel.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

struct ResponseModel: Codable {
    let results: [DishModel]
    let offset: Int
    let number: Int
    let totalResults: Int
}


struct DishModel: Codable {
    let id: Int
    let title: String
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imagePath = "image"
    }
}
