//
//  MenuView.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import UIKit

final class MenuView: UIView {
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        return cell
    }
}
