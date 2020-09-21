//
//  ShadowCommonUIView.swift
//  TestLalamove
//
//  Created by Stella Patricia on 20/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import UIKit

class CommonUIView: UIView {
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
        self.backgroundColor = Constants.BASIC_COLOR_PASTEL_ORANGE
    }
}
