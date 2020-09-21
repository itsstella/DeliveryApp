//
//  ShadowBannerUIView.swift
//  TestLalamove
//
//  Created by Stella Patricia on 20/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class ShadowBannerUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = Constants.BASIC_VIEW_BG_COLOR
        self.layer.borderColor = Constants.BASIC_BORDER_COLOR
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4.0
    }
}
