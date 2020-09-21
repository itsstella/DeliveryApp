//
//  CommonRetryUIButton.swift
//  TestLalamove
//
//  Created by Stella Patricia on 21/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class CommonUIButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.contentMode = .scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
}
