//
//  MainPresenter.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import Foundation
import UIKit

final class MainPresenter {
    weak var view: MainViewProtocol?
    
    func numberOfSections() -> Int {
        2
    }
    
    private func parse(data: [ResultForRoute]) -> ([Route], [ItemModel]){
        var titles = [Route]()
        var itemModel = [ItemModel]()
        
        for element in data {
            
            for i in element.result {
                itemModel.append(ItemModel(category: element.forRoute, name: i.title, imagePath: i.imagePath))
            }
            
            titles.append(element.forRoute)
        }
        
        return (titles, itemModel)
    }
    
    func viewDidLoaded() {
        view?.showLoader()
        let routes: [Route] = Route.allCases
    
        NetworkService.shared.fetchDishes(routes: routes) { result in
            self.view?.hideLoader()
            switch result {
            case .success(let data):
                let data = self.parse(data: data)
                self.view?.setupMenu(with: data.0)
                self.view?.setupTableView(with: data.1)
            case .failure(let failure):
                self.view?.showError(with: failure.localizedDescription)
            }
        }
    }
}
