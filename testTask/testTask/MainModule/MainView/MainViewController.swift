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
    private let loader = UIActivityIndicatorView()
    private let loaderView = UIView()
    
    private var data = [MainModel]()
    
    private let cityView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let cityTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Moscow"
        label.font = UIFont.defaultBoldFont
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow.down")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    private let menuView: MenuView = {
        let view = MenuView()
        return view
    }()
    
    // Таблица для скроллинга основной view
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        return tableView
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
        presenter.viewDidLoaded()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.shared.mainBackgroundColor
        
        view.addSubview(cityView)
        cityView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        cityView.addSubview(cityTitle)
        cityTitle.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
        }
        
        cityView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalTo(cityTitle.snp.trailing).offset(10)
            make.size.equalTo(14)
            make.centerY.equalTo(cityTitle.snp.centerY)
        }
        
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(cityView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
}

extension MainViewController: MainViewProtocol {
    func setupMenu(with titles: [String]) {
        menuView.configure(with: titles)
    }
    
    func setupTableView(with data: [MainModel]) {
        self.data = data
        mainTableView.reloadData()
    }
    
    func showLoader() {
        view.addSubview(loaderView)
        loaderView.backgroundColor = .white
        loaderView.frame = view.bounds
        loaderView.addSubview(loader)
        loader.startAnimating()
        loader.center = loaderView.center
    }
    
    func hideLoader() {
        view.alpha = 1
        loader.stopAnimating()
        loader.removeFromSuperview()
        loaderView.removeFromSuperview()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 + data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            menuView.backgroundColor = .clear
            return menuView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 0
        }
        
        return data[section - 2].items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return view.bounds.width * 0.15
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.bounds.width * 0.3
        }
        
        return view.bounds.width * 0.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.backgroundColor = .clear
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
            cell.backgroundColor = .white
            
            if indexPath.section > 1 {
                cell.configure(with: data[indexPath.section - 2].items[indexPath.row])
                
                if indexPath.section == 2 && indexPath.row == 0 {
                    cell.layer.cornerRadius = 20
                    cell.layer.cornerCurve = .continuous
                    cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                }
            }
            
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > menuView.bounds.maxY {
            menuView.backgroundColor = .white
            view.backgroundColor = .white
        } else {
            menuView.backgroundColor = .clear
            view.backgroundColor = UIColor.shared.mainBackgroundColor
        }
    }

}
