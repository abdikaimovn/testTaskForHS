//
//  UIFont+Extension.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import UIKit

// Создание дефолтного шрифта под разные размеры экрана
extension UIFont {
    static var defaultFont: UIFont {
        let screenSize = UIScreen.main.bounds.size
        let fontSize: CGFloat

        switch min(screenSize.width, screenSize.height) {
        case 0..<375: // Small screens (e.g., iPhone SE)
            fontSize = 14.0
        case 375..<414: // Medium screens (e.g., iPhone 8, iPhone X, iPhone 11)
            fontSize = 16.0
        case 414..<428: // iPhone 12 mini, iPhone 13 mini
            fontSize = 16.0
        case 428..<768: // Large screens (e.g., iPhone 12, iPhone 13)
            fontSize = 18.0
        default: // Extra-large screens (e.g., iPad)
            fontSize = 20.0
        }
        
        let font = UIFont(name: "SFUIDisplay-Light", size: fontSize)!
        return font
    }
    
    static var defaultBoldFont: UIFont {
        let screenSize = UIScreen.main.bounds.size
        let fontSize: CGFloat

        switch min(screenSize.width, screenSize.height) {
        case 0..<375: // Small screens (e.g., iPhone SE)
            fontSize = 14.0
        case 375..<414: // Medium screens (e.g., iPhone 8, iPhone X, iPhone 11)
            fontSize = 16.0
        case 414..<428: // iPhone 12 mini, iPhone 13 mini
            fontSize = 16.0
        case 428..<768: // Large screens (e.g., iPhone 12, iPhone 13)
            fontSize = 18.0
        default: // Extra-large screens (e.g., iPad)
            fontSize = 20.0
        }
        
        let font = UIFont(name: "SFUIDisplay-Bold", size: fontSize)!
        return font
    }
}

