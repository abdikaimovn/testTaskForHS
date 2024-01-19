//
//  ItemTableViewCell.swift
//  testTask
//
//  Created by Нурдаулет on 14.01.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class ItemTableViewCell: UITableViewCell {
    private let itemView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let itemImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.defaultBoldFont
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Natoque penatibus et magnis dis parturient montes. Nec nam aliquam sem et tortor. Adipiscing elit duis tristique sollicitudin nibh sit. Sit amet tellus cras adipiscing."
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
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.shared.mainBackgroundColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
   
     private var imageDownloadTask: DownloadTask?
    
     override func prepareForReuse() {
         super.prepareForReuse()
         imageDownloadTask?.cancel()
         itemImage.image = nil
     }

     func configure(with data: ItemModel) {
         imageDownloadTask?.cancel()

         if let url = URL(string: data.imagePath) {
             imageDownloadTask = itemImage.kf.setImage(with: url)
         }

         titleLabel.text = data.name
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        
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
        
        itemView.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
