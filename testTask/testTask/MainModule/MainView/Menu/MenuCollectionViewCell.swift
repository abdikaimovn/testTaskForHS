//
//  MenuCollectionViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 13.01.2024.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    private let sectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пицца", for: .normal)
        button.titleLabel?.font = UIFont.defaultBoldFont
        button.layer.borderColor = UIColor.shared.lightPink.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 15
        button.isUserInteractionEnabled = false
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
    
    func configure(model: SectionModel) {
        self.sectionButton.setTitle(model.title.rawValue, for: .normal)
        
        if model.isSelected {
            sectionButton.setTitleColor(UIColor.shared.darkPink, for: .normal)
            sectionButton.backgroundColor = UIColor.shared.lightPink
        } else {
            sectionButton.setTitleColor(UIColor.shared.lightPink, for: .normal)
            sectionButton.backgroundColor = .clear
        }
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
