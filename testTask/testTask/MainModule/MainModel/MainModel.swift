//
//  MainModel.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import Foundation
import UIKit

struct MainModel {
    let category: String
    let items: [ItemModel]
}

struct ItemModel {
    let name: String
    let imagePath: String
}
