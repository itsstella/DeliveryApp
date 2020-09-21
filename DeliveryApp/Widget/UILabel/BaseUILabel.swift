//
//  StandartUILabel.swift
//  TestLalamove
//
//  Created by Stella Patricia on 20/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class BaseUILabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.textColor =  Constants.BASIC_FONT_COLOR
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
