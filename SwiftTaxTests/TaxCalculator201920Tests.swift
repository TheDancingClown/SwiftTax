//
//  TaxCalculatorTests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 26/11/2020.
//

import XCTest
@testable import SwiftTax

class TaxCalculator201920Tests: XCTestCase {
    
    let calc = TaxCalculator()

    func testNoTaxDeductedUnderThePersonalAllowance() throws {
        let net = calc.deductTax(gross: 10000.35)
        XCTAssertEqual(net, 10000.35)
    }
    
    func testDeductsBasicTax() throws {
        let net = calc.deductTax(gross: 20000)
        XCTAssertEqual(net, 18500)
    }
    
    func testDeductsBasicTaxWithDecimal() throws {
        let net = calc.deductTax(gross: 23000.35)
        XCTAssertEqual(net, 20900.28)
    }
    
    func testDeductHigherRateTax() throws {
        let net = calc.deductTax(gross: 55000)
        XCTAssertEqual(net, 45500)
    }
    
    func testDeductHigherRateTaxWithDecimal() throws {
        let net = calc.deductTax(gross: 62000.47)
        XCTAssertEqual(net, 49700.28)
    }
    
    func testPersonalAllowanceReduction() throws {
        let net = calc.deductTax(gross: 115000)
        XCTAssertEqual(net, 78500)
    }
    
    func testTotalPersonalAllowanceReduction() throws {
        let net = calc.deductTax(gross: 135000)
        XCTAssertEqual(net, 88500)
    }
    
    func testAdditionalRateTax() throws {
        let net = calc.deductTax(gross: 155000)
        XCTAssertEqual(net, 100250)
    }
    
    func testAdditionalRateTaxWithDecimal() throws {
        let net = calc.deductTax(gross: 200000.75)
        XCTAssertEqual(net, 125000.41)
    }
    
    func testPersonaAllowance() throws {
        let net = calc.deductTax(gross: 12500)
        XCTAssertEqual(net, 12500)
    }
    
    func testBasicThreshold() throws {
        let net = calc.deductTax(gross: 50000)
        XCTAssertEqual(net, 42500)
    }
    
    func testAllowanceReductionLimit() throws {
        let net = calc.deductTax(gross: 125000)
        XCTAssertEqual(net, 82500)
    }
    
    func testAdditonalThreshold() throws {
        let net = calc.deductTax(gross: 150000)
        XCTAssertEqual(net, 97500)
    }
}
