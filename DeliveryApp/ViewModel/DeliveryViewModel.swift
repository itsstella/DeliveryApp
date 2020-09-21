//
//  DeliveryViewModel.swift
//  TestLalamove
//
//  Created by Stella Patricia on 21/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

@objc protocol DeliveryViewModelProtocol {
    func showRetryBtn()
    func hideRetryBtn()
}

class DeliveryViewModel {
    var deliveries = BehaviorRelay<[DeliveryModel]>(value: [])
    var delegate: DeliveryViewModelProtocol? = nil
    var previousPage = -1

    func getDeliveries(offset: Int){
        
        guard let url = URL(string: "https://mock-api-mobile.dev.lalamove.com/v2/deliveries?offset=0&limit="+String(offset*20)+"") else {return}
        URLSession.shared.dataTask(with: url){(data, response, error) in
            do{
                self.deliveries.accept(try JSONDecoder().decode([DeliveryModel].self, from: data!))
                self.delegate?.hideRetryBtn()
            }catch let err{
                print(err)
                self.delegate?.showRetryBtn()
            }
        }.resume()
    }
}
