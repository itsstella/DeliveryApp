//
//  ShadowUIView.swift
//  TestLalamove
//
//  Created by Stella Patricia on 20/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class ShadowUIView: UIView {
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
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4.0
    }
}
