//
//  MainPresenter.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import Foundation

final class MainPresenter {
    weak var view: MainViewProtocol?
    
    func viewDidLoaded() {
        NetworkService.shared.fetchDishes(route: .asian) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
