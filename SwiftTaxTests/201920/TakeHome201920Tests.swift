//
//  TakeHome201920Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class TakeHome201920Tests: XCTestCase {

    let takeHome = TakeHomeCalculator201920()
    
    func testNoDeductions() throws {
        let net = takeHome.calculateNet(gross: 5000)
        XCTAssertEqual(net, 5000.00)
    }
    
    func testBasicDeduction() throws {
        let net = takeHome.calculateNet(gross: 25000)
        XCTAssertEqual(net, 20535.84)
    }
    
    func testHigherRate() throws {
        let net = takeHome.calculateNet(gross: 75000)
        XCTAssertEqual(net, 52035.84)
    }
    
    func testAllowanceReduction() throws {
        let net = takeHome.calculateNet(gross: 110000)
        XCTAssertEqual(net, 70335.84)
    }
    
    func testAdditionalRate() throws {
        let net = takeHome.calculateNet(gross: 175000)
        XCTAssertEqual(net, 103785.84)
    }

}
