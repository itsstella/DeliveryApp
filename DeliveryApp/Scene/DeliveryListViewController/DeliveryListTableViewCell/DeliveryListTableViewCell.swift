//
//  DeliveryListTableViewCell.swift
//  TestLalamove
//
//  Created by Stella Patricia on 19/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import UIKit

class DeliveryListTableViewCell: UITableViewCell {
    
    let containerView = ShadowUIView()
    
    let imageViewPhoto :UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    let labelFromTitle = CommonMediumUILabel()
    let labelFromContent = CommonMediumUILabel()
    let labelToTitle = CommonMediumUILabel()
    let labelToContent = CommonMediumUILabel()
    let labelPrice = CommonTitleUILabel()
    
    let buttonLike = CommonUIButton()
    let containerViewLike = ShadowBannerUIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelFromTitle.text = "From : "
        labelToTitle.text = "To : "
        
        initCell()
        setCellConstraint()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func initCell() {
        self.backgroundColor = Constants.BASIC_BG_COLOR
        self.selectionStyle = .none
        
        containerView.addSubview(imageViewPhoto)
        containerView.addSubview(labelFromTitle)
        containerView.addSubview(labelFromContent)
        containerView.addSubview(labelToTitle)
        containerView.addSubview(labelToContent)
        containerView.addSubview(labelPrice)
        
        containerViewLike.addSubview(buttonLike)
    
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(containerViewLike)
    }
    
    func setCellConstraint() {
        // Constraint for containter view
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        // Constraint for photo image view
        imageViewPhoto.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        imageViewPhoto.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:8).isActive = true
        imageViewPhoto.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageViewPhoto.heightAnchor.constraint(equalToConstant: 90).isActive = true

        // Constraint for from and to
        labelFromTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        labelFromTitle.leadingAnchor.constraint(equalTo: imageViewPhoto.leadingAnchor, constant: 98).isActive = true
        labelFromTitle.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelFromContent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        labelFromContent.leadingAnchor.constraint(equalTo: labelFromTitle.leadingAnchor, constant: 50).isActive = true
        labelFromContent.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -15).isActive = true

        labelToTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        labelToTitle.leadingAnchor.constraint(equalTo: imageViewPhoto.leadingAnchor, constant: 98).isActive = true
        labelToTitle.widthAnchor.constraint(equalToConstant: 50).isActive = true

        labelToContent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        labelToContent.leadingAnchor.constraint(equalTo: labelToTitle.leadingAnchor, constant: 50).isActive = true
        labelToContent.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -15).isActive = true
        
        // Constraint for like banner
        containerViewLike.widthAnchor.constraint(equalToConstant: 30).isActive = true
        containerViewLike.heightAnchor.constraint(equalToConstant: 40).isActive = true
        containerViewLike.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        containerViewLike.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true

        buttonLike.widthAnchor.constraint(equalToConstant: 20).isActive = true
        buttonLike.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonLike.centerXAnchor.constraint(equalTo: containerViewLike.centerXAnchor).isActive = true
        buttonLike.bottomAnchor.constraint(equalTo: containerViewLike.bottomAnchor, constant: -5).isActive = true
        
        // Constraint for price label
        labelPrice.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        labelPrice.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
    }
}
