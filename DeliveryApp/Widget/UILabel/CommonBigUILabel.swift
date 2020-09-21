//
//  CommonBigUILabel.swift
//  TestLalamove
//
//  Created by Stella Patricia on 20/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class CommonBigUILabel: BaseUILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.font = UIFont.boldSystemFont(ofSize: 17)
    }
}
