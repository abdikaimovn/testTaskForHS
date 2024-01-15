//
//  MenuView.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import UIKit

protocol MenuViewDelegate: AnyObject {
    func sectionButtonDidTapped(with route: Route)
}

final class MenuView: UIView {
    weak var delegate: MenuViewDelegate?
    private var selectedCategoryIndex: Int = 0
    
    private var categories = [SectionModel]()
    
    private lazy var menuCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        var cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.isUserInteractionEnabled = true
        cView.backgroundColor = .clear
        cView.dataSource = self
        cView.delegate = self
        cView.showsHorizontalScrollIndicator = false
        cView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        return cView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func configure(with titles: [Route]) {
        //Пробразование [Route] в [SectionModel]
        for title in 0..<titles.count {
            if title == 0 {
                categories.append(SectionModel(isSelected: true, title: titles[title]))
            } else {
                categories.append(SectionModel(isSelected: false, title: titles[title]))
            }
        }
        menuCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update itemSize based on superview's width and height
        if let layout = menuCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: bounds.width * 0.25, height: bounds.height * 0.6)
        }
    
        menuCollectionView.reloadData()
    }
}

extension MenuView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexes = [IndexPath(row: selectedCategoryIndex, section: 0), IndexPath(row: indexPath.row, section: 0)]
        categories[selectedCategoryIndex].isSelected = false
        categories[indexPath.row].isSelected = true
        selectedCategoryIndex = indexPath.row
        collectionView.reloadItems(at: indexes)
        collectionView.scrollToItem(at: indexes[1], at: .centeredHorizontally, animated: true)
        delegate?.sectionButtonDidTapped(with: categories[indexPath.row].title)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.configure(model: categories[indexPath.row])
        return cell
    }
}
