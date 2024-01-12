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
    
    //UI Elements
    private let cityTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.defaultBoldFont
        title.textColor = .black
        title.text = "Moscow"
        return title
    }()
    
    private let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow.down")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
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
    
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(cityTitle)
        cityTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        view.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalTo(cityTitle.snp.leading).offset(70)
            make.size.equalTo(14)
            make.centerY.equalTo(cityTitle.snp.centerY)
        }
    }
}

extension MainViewController: MainViewProtocol {
    
}
