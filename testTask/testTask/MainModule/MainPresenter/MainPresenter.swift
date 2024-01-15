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
    
    func viewDidLoaded() {
        view?.showLoader()
        let dispatchGroup = DispatchGroup()
        var titles = [Route]()
        let routes: [Route] = [.asian, .american, .european, .german, .italian]
        
        dispatchGroup.enter()
        NetworkService.shared.fetchDishes(routes: routes) { result in
            switch result {
            case .success(let data):
                var itemModel: [ItemModel] = []
                for element in data {
                    
                    for i in element.result {
                        itemModel.append(ItemModel(category: element.forRoute, name: i.title, imagePath: i.imagePath))
                    }
                    
                    titles.append(element.forRoute)
                }
                
                self.view?.hideLoader()
                self.view?.setupMenu(with: titles)
                self.view?.setupTableView(with: itemModel)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
