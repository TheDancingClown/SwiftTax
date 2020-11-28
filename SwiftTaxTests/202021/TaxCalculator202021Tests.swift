//
//  TaxCalculator202021Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class TaxCalculator202021Tests: XCTestCase {
    
    let calc = PayeCalculator202021()

    func testNoTaxDeductedUnderThePersonalAllowance() throws {
        let net = calc.paye(gross: 10000)
        XCTAssertEqual(net, 0.00)
    }
    
    func testDeductsBasicTax() throws {
        let net = calc.paye(gross: 20000)
        XCTAssertEqual(net, 1500.00)
    }
    
    func testDeductHigherRateTax() throws {
        let net = calc.paye(gross: 55000)
        XCTAssertEqual(net, 9500.00)
    }
    
    func testPersonalAllowanceReduction() throws {
        let net = calc.paye(gross: 115000)
        XCTAssertEqual(net, 36500.00)
    }
    
    func testTotalPersonalAllowanceReduction() throws {
        let net = calc.paye(gross: 135000)
        XCTAssertEqual(net, 46500.00)
    }
    
    func testAdditionalRateTax() throws {
        let net = calc.paye(gross: 200000)
        XCTAssertEqual(net, 75000.00)
    }
    
    func testPersonaAllowance() throws {
        let net = calc.paye(gross: 12500)
        XCTAssertEqual(net, 0.00)
    }
    
    func testBasicThreshold() throws {
        let net = calc.paye(gross: 50000)
        XCTAssertEqual(net, 7500.00)
    }
    
    func testAllowanceReductionLimit() throws {
        let net = calc.paye(gross: 125000)
        XCTAssertEqual(net, 42500.00)
    }
    
    func testAdditonalThreshold() throws {
        let net = calc.paye(gross: 150000)
        XCTAssertEqual(net, 52500.00)
    }
}
