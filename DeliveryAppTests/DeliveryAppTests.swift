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

    var viewController:DeliveryListViewController!
    
    override func setUpWithError() throws {
        viewController = DeliveryListViewController()
        viewController.loadView()
        viewController.setupCustomNavigationView()
        viewController.setupTableView()
        viewController.setupBottomView()
        viewController.showLoadingIndicator()
        viewController.fetchDeliveryData()
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
