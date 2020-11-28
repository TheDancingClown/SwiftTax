//
//  TakeHome202021Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 28/11/2020.
//

import XCTest
@testable import SwiftTax

class TakeHome202021Tests: XCTestCase {

    let takeHome = TakeHomeCalculator202021()
    
    func testNoDeductions() throws {
        let net = takeHome.calculateNet(gross: 5000)
        XCTAssertEqual(net, 5000.00)
    }
    
    func testBasicDeduction() throws {
        let net = takeHome.calculateNet(gross: 25000)
        XCTAssertEqual(net, 20640)
    }
    
    func testHigherRate() throws {
        let net = takeHome.calculateNet(gross: 75000)
        XCTAssertEqual(net, 52140)
    }
    
    func testAllowanceReduction() throws {
        let net = takeHome.calculateNet(gross: 110000)
        XCTAssertEqual(net, 70440)
    }
    
    func testAdditionalRate() throws {
        let net = takeHome.calculateNet(gross: 175000)
        XCTAssertEqual(net, 103890)
    }

}
