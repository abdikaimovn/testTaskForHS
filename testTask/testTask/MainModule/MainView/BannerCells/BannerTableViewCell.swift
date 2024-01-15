//
//  BannerTableViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import UIKit
import SnapKit

final class BannerTableViewCell: UITableViewCell {
    private lazy var bannerCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: contentView.bounds.width, height: contentView.bounds.width * 0.35)
        layout.minimumLineSpacing = 24
        layout.collectionView?.backgroundColor = .clear
        layout.scrollDirection = .horizontal
        var cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.isUserInteractionEnabled = true
        cView.dataSource = self
        cView.backgroundColor = .clear
        cView.showsHorizontalScrollIndicator = false
        cView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        return cView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        contentView.addSubview(bannerCollectionView)
        bannerCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension BannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        return cell
    }
}
