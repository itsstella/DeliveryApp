//
//  DeliveryViewModelProtocolMock.swift
//  DeliveryAppTests
//
//  Created by Stella Patricia on 21/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation

@testable import DeliveryApp

class DeliveryViewModelProtocolMock: DeliveryViewModelProtocol {
    var didShowBtn: Bool = false
    var didHideBtn: Bool = false
    
    func showRetryBtn() {
        didShowBtn = true
    }
    
    func hideRetryBtn() {
        didHideBtn = true
    }
    
    
}
