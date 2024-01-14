//
//  BannerCollectionViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 13.01.2024.
//

import UIKit
import SnapKit

final class BannerCollectionViewCell: UICollectionViewCell {
    private let bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "mock")
        image.layer.cornerRadius = 10
        image.layer.cornerCurve = .continuous
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(bannerImageView)
        contentView.backgroundColor = .clear
        bannerImageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }

}
