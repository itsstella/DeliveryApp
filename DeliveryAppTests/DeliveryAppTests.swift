//
//  DeliveryAppTests.swift
//  DeliveryAppTests
//
//  Created by Stella Patricia on 21/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import XCTest
@testable import DeliveryApp

class DeliveryAppTests: XCTestCase {

    var deliveryList: DeliveryListViewController!
    var deliveryDetail: DeliveryDetailViewController!
    var deliveryCell: DeliveryListTableViewCell!
    
    let myDelegate = DeliveryViewModelProtocolMock()
    
    override func setUpWithError() throws {
        super.setUp()

        deliveryList = DeliveryListViewController()
        deliveryList.loadView()
        deliveryList.setupCustomNavigationView()
        deliveryList.setupBottomView()
        deliveryList.showLoadingIndicator()
        
        deliveryDetail = DeliveryDetailViewController()
        deliveryDetail.viewDidLoad()
        deliveryDetail.setupView()
        deliveryDetail.setConstraint()
        deliveryDetail.setupCustomNavigationView()
        
        deliveryCell = DeliveryListTableViewCell()
        deliveryCell.initCell()
        deliveryCell.setCellConstraint()
        
        myDelegate.showRetryBtn()
        myDelegate.hideRetryBtn()
        XCTAssertTrue(myDelegate.didShowBtn)
        XCTAssertTrue(myDelegate.didHideBtn)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
