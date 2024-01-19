//
//  Route.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import Foundation

struct AppConfig {
    //Ключ для api (Api может обрабатывать в день 150 запросов так как это 'Бесплатный план')
    //В случае если запросы не работают, причиной может быть лимит api
    static let apiKey = "631a60d7da9f45278a1094b4a8764c5c"
}

enum Route: String, CaseIterable {
    static let baseUrl = "https://api.spoonacular.com/recipes/complexSearch?cuisine="
    
    case asian = "Asian"
    case american = "American"
    case german = "German"
    case italian = "Italian"
    case european = "European"
    
    var description: String {
        switch self {
        case .asian:
            return "asian"
        case .american:
            return "american"
        case .german:
            return "german"
        case .italian:
            return "italian"
        case .european:
            return "european"
        }
    }
}
