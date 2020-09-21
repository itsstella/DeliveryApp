//
//  DeliveryModel.swift
//  TestLalamove
//
//  Created by Stella Patricia on 21/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation

class DeliveryModel: Decodable {
    var id: String?
    var remarks: String?
    var pickupTime: String?
    var goodsPicture: String?
    var deliveryFee: String?
    var surcharge: String?
    var route: Route?
    var sender: Sender?

    class Route: Decodable {
        var start: String?
        var end: String?
    }

    class Sender: Decodable {
        var phone: String?
        var name: String?
        var email: String?
    }
}
