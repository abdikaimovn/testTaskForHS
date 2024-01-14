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
        var mainModel = [MainModel]()
        var titles = [String]()
        let routes: [Route] = [.asian, .american, .european, .german, .italian]
        
        dispatchGroup.enter()
        NetworkService.shared.fetchDishes(routes: routes) { result in
            switch result {
            case .success(let data):
                for element in data {
                    var itemModel: [ItemModel] = []
                    
                    for i in element.result {
                        itemModel.append(ItemModel(name: i.title, imagePath: i.imagePath))
                    }
                    titles.append(element.forRoute.rawValue)
                    mainModel.append(
                        MainModel(category: element.forRoute.rawValue,
                                  items: itemModel)
                    )
                }
                self.view?.hideLoader()
                self.view?.setupMenu(with: titles)
                self.view?.setupTableView(with: mainModel)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
