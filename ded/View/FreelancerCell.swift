//
//  FreelancerCell.swift
//  ded
//
//  Created by Денис Каратеев on 10.01.2021.
//

import UIKit

class FreelancerCell: UICollectionViewCell {
    
    let descriptionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let price: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkMark: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let image52: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews(){
        backgroundColor = UIColor.black
        
        addSubview(titleLabel)
        addSubview(price)
        addSubview(checkMark)
        addSubview(descriptionText)
        addSubview(image52)
        
        image52.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        image52.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        image52.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image52.heightAnchor.constraint(equalToConstant: 60).isActive = true
        titleLabel.topAnchor.constraint(equalTo: image52.topAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: image52.rightAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        price.widthAnchor.constraint(equalToConstant: 300).isActive = true
        price.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 10).isActive = true
        price.leftAnchor.constraint(equalTo: descriptionText.leftAnchor, constant: 0).isActive = true
        checkMark.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        checkMark.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0).isActive = true
        descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        descriptionText.heightAnchor.constraint(equalToConstant: 70).isActive = true

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

