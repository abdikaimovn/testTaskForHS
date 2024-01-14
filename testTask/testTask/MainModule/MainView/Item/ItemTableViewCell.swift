//
//  ItemTableViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import UIKit
import SnapKit

final class ItemTableViewCell: UITableViewCell {
    private let itemView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let itemImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.defaultBoldFont
        label.text = "Test"
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test"
        label.font = UIFont.defaultFont
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("от 345 р", for: .normal)
        button.titleLabel?.font = UIFont.defaultFont
        button.layer.borderColor = UIColor.shared.darkPink.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        button.setTitleColor(UIColor.shared.darkPink, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(itemView)
        
        itemView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        itemView.addSubview(itemImage)

        itemImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(itemView.snp.height).multipliedBy(0.7)
            make.centerY.equalToSuperview()
        }
        
        itemView.addSubview(titleLabel)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(itemImage.snp.trailing).offset(32)
            make.top.equalTo(itemImage.snp.top)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        itemView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-24)
        }

        itemView.addSubview(buyButton)
        buyButton.setContentCompressionResistancePriority(.required, for: .vertical)
        buyButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(descriptionLabel.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(descriptionLabel.snp.width).dividedBy(2)
            make.bottom.equalToSuperview().offset(-24)
        }

    }
}
