//
//  ViewController.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private let presenter: MainPresenter
    
    // LifeCycle
    init(presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MainViewController: MainViewProtocol {
    
}
