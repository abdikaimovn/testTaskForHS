//
//  Protocols.swift
//  testTask
//
//  Created by Нурдаулет on 13.01.2024.
//

import Foundation

protocol MainViewProtocol: AnyObject{
    func showLoader()
    func hideLoader()
    func setupMenu(with titles: [String])
    func setupTableView(with data: [MainModel])
}
