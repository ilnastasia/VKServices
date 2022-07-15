//
//  ServiceCollectionViewCell.swift
//  VKServices
//
//  Created by Anastasia Ilina on 14.07.2022.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        contentView.addSubview(appImage)
        contentView.addSubview(appNameLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .blue
        return image
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вконтакте"
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Самая популярная соцсеть..."
        label.textColor = .black
        return label
    }()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            appImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            appImage.heightAnchor.constraint(equalToConstant: 70),
            appImage.widthAnchor.constraint(equalToConstant: 70),
            
            appNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            appNameLabel.leftAnchor.constraint(equalTo: appImage.rightAnchor, constant: 16),
            appNameLabel.widthAnchor.constraint(equalToConstant: 150),
            appNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: appNameLabel.leftAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 150),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        let constraint = contentView.heightAnchor.constraint(equalToConstant: 150)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(751)
    }
}

