//
//  DeliveryDetailViewController.swift
//  TestLalamove
//
//  Created by Stella Patricia on 19/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import UIKit

class DeliveryDetailViewController: UIViewController {
    
    var data: DeliveryModel?
    
    let containerHeaderView = ShadowUIView()
    
    let imageViewPhoto :UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
       return img
    }()
    
    let labelFromTitle = CommonBigUILabel()
    let labelFromContent = CommonBigUILabel()
    let labelToTitle = CommonBigUILabel()
    let labelToContent = CommonBigUILabel()
    
    let containerFeeView = ShadowUIView()
    
    let labelFeeTitle = CommonMediumUILabel()
    let labelFeeContent = CommonMediumUILabel()
    let labelSurchargeTitle = CommonMediumUILabel()
    let labelSurchargeContent = CommonMediumUILabel()
    let labelTotalFeeTitle = CommonBigUILabel()
    let labelTotalFeeContent = CommonBigUILabel()
    
    let containerBottomView = CommonUIView()
    
    let buttonLike = CommonUIButton()
    
    let containerViewLike = ShadowBannerUIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewPhoto.kf.setImage(with: URL(string: data?.goodsPicture ?? ""))
        if imageViewPhoto.image == nil {
            imageViewPhoto.image = UIImage(named: Constants.ICON_NO_IMAGE)
        }
        labelFromContent.text = data?.route?.start
        labelToContent.text = data?.route?.end
        
        labelFeeContent.text = data?.deliveryFee
        labelSurchargeContent.text = data?.surcharge
        
        let strDeliveryFee = Double((data?.deliveryFee ?? "").replacingOccurrences(of: "$", with: "")) ?? 0.0
        let strSurcharge = Double((data?.surcharge ?? "").replacingOccurrences(of: "$", with: "")) ?? 0.0
        let totalFee = strDeliveryFee+strSurcharge
            
        labelTotalFeeContent.text = String(format: "$%.2f", totalFee)
        
        
        buttonLike.addTarget(self, action: #selector(tappedLikeBtn), for: .touchUpInside)
        if (UserDefaults.standard.stringArray(forKey: data?.id ?? "-") != nil) {
            buttonLike.setImage(UIImage(named: Constants.ICON_LIKE), for: UIControl.State.normal)
        } else {
            buttonLike.setImage(UIImage(named: Constants.ICON_UNLIKE), for: UIControl.State.normal)
        }
        
        labelFromTitle.text = "From : "
        labelToTitle.text = "To : "
        labelFeeTitle.text = "Delivery Fee"
        labelSurchargeTitle.text = "Surcharge"
        labelTotalFeeTitle.text = "Total Delivery Fee"

        setupCustomNavigationView()
        setupView()
        setConstraint()
    }

    func setupView() {
        self.view.backgroundColor = Constants.BASIC_BG_COLOR

        containerHeaderView.addSubview(labelFromTitle)
        containerHeaderView.addSubview(labelFromContent)
        containerHeaderView.addSubview(labelToTitle)
        containerHeaderView.addSubview(labelToContent)
        
        containerFeeView.addSubview(labelFeeTitle)
        containerFeeView.addSubview(labelFeeContent)
        containerFeeView.addSubview(labelSurchargeTitle)
        containerFeeView.addSubview(labelSurchargeContent)
        containerFeeView.addSubview(labelTotalFeeTitle)
        containerFeeView.addSubview(labelTotalFeeContent)
        
        containerViewLike.addSubview(buttonLike)
        
        self.view.addSubview(imageViewPhoto)
        self.view.addSubview(containerHeaderView)
        self.view.addSubview(containerFeeView)
        self.view.addSubview(containerBottomView)
        self.view.addSubview(containerViewLike)
    }
    
    func setConstraint() {
        
        imageViewPhoto.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageViewPhoto.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        imageViewPhoto.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        imageViewPhoto.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        containerHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 220).isActive = true
        containerHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        containerHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10).isActive = true
        containerHeaderView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        // Constraint for from and to
        labelFromTitle.topAnchor.constraint(equalTo: containerHeaderView.topAnchor, constant: 20).isActive = true
        labelFromTitle.leadingAnchor.constraint(equalTo: containerHeaderView.leadingAnchor, constant: 20).isActive = true
        labelFromTitle.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        labelFromContent.topAnchor.constraint(equalTo: containerHeaderView.topAnchor, constant: 20).isActive = true
        labelFromContent.leadingAnchor.constraint(equalTo: labelFromTitle.leadingAnchor, constant: 60).isActive = true
        labelFromContent.trailingAnchor.constraint(equalTo: containerHeaderView.trailingAnchor, constant: -15).isActive = true

        labelToTitle.topAnchor.constraint(equalTo: containerHeaderView.topAnchor, constant: 50).isActive = true
        labelToTitle.leadingAnchor.constraint(equalTo: containerHeaderView.leadingAnchor, constant: 20).isActive = true
        labelToTitle.widthAnchor.constraint(equalToConstant: 60).isActive = true

        labelToContent.topAnchor.constraint(equalTo: containerHeaderView.topAnchor, constant: 50).isActive = true
        labelToContent.leadingAnchor.constraint(equalTo: labelToTitle.leadingAnchor, constant: 60).isActive = true
        labelToContent.trailingAnchor.constraint(equalTo: containerHeaderView.trailingAnchor, constant: -15).isActive = true
        
        // Constraint for container delivery fee
        containerFeeView.topAnchor.constraint(equalTo: containerHeaderView.topAnchor, constant: 110).isActive = true
        containerFeeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        containerFeeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        containerFeeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        labelFeeTitle.topAnchor.constraint(equalTo: containerFeeView.topAnchor, constant: 10).isActive = true
        labelFeeTitle.leadingAnchor.constraint(equalTo: containerFeeView.leadingAnchor, constant: 10).isActive = true
        
        labelFeeContent.topAnchor.constraint(equalTo: labelFeeTitle.topAnchor).isActive = true
        labelFeeContent.trailingAnchor.constraint(equalTo: containerFeeView.trailingAnchor, constant: -10).isActive = true
        
        labelSurchargeTitle.topAnchor.constraint(equalTo: labelFeeTitle.topAnchor, constant: 20).isActive = true
        labelSurchargeTitle.leadingAnchor.constraint(equalTo: containerFeeView.leadingAnchor, constant: 10).isActive = true
        
        labelSurchargeContent.topAnchor.constraint(equalTo: labelSurchargeTitle.topAnchor).isActive = true
        labelSurchargeContent.trailingAnchor.constraint(equalTo: containerFeeView.trailingAnchor, constant: -10).isActive = true
        
        labelTotalFeeTitle.bottomAnchor.constraint(equalTo: containerFeeView.bottomAnchor, constant: -10).isActive = true
        labelTotalFeeTitle.leadingAnchor.constraint(equalTo: containerFeeView.leadingAnchor, constant: 10).isActive = true
        
        labelTotalFeeContent.bottomAnchor.constraint(equalTo: labelTotalFeeTitle.bottomAnchor).isActive = true
        labelTotalFeeContent.trailingAnchor.constraint(equalTo: containerFeeView.trailingAnchor, constant: -10).isActive = true
        
        //Constraint for bottom view
        containerBottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerBottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerBottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        containerBottomView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // Constraint for like banner
        containerViewLike.widthAnchor.constraint(equalToConstant: 50).isActive = true
        containerViewLike.heightAnchor.constraint(equalToConstant: 70).isActive = true
        containerViewLike.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        containerViewLike.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true

        buttonLike.widthAnchor.constraint(equalToConstant: 35).isActive = true
        buttonLike.heightAnchor.constraint(equalToConstant: 35).isActive = true
        buttonLike.centerXAnchor.constraint(equalTo: containerViewLike.centerXAnchor).isActive = true
        buttonLike.bottomAnchor.constraint(equalTo: containerViewLike.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupCustomNavigationView() {
        navigationItem.title = "Delivery Detail"
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = Constants.BASIC_COLOR_PASTEL_ORANGE
        self.navigationController?.navigationBar.isTranslucent = false

    }
    
    @objc func tappedLikeBtn() {
        if (UserDefaults.standard.stringArray(forKey: data?.id ?? "-") == nil) {
            buttonLike.setImage(UIImage(named: Constants.ICON_LIKE), for: .normal)
            UserDefaults.standard.set([data?.remarks], forKey: data?.id ?? "00")
        } else {
            buttonLike.setImage(UIImage(named: Constants.ICON_UNLIKE), for: .normal)
            UserDefaults.standard.removeObject(forKey: data?.id ?? "-")
        }
    }
}
