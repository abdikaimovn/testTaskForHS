//
//  MenuCollectionViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 13.01.2024.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    private let sectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пицца", for: .normal)
        button.titleLabel?.font = UIFont.defaultFont
        button.layer.borderColor = UIColor.shared.lightPink.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 15
        button.layer.cornerCurve = .continuous
        button.setTitleColor(UIColor.shared.lightPink, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear

        contentView.addSubview(sectionButton)
        sectionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.trailing.bottom.equalToSuperview()
        }
    }

}
