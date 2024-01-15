//
//  MainModel.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import Foundation
import UIKit

struct ItemModel {
    let category: Route
    let name: String
    let imagePath: String
}

//Модель для MenuView
struct SectionModel {
    var isSelected: Bool
    let title: Route
}
