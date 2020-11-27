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
        let net = calc.deductTax(salary: 10000.35)
        XCTAssertEqual(net, 10000.35)
    }
    
    func testDeductsBasicTax() throws {
        let net = calc.deductTax(salary: 20000)
        XCTAssertEqual(net, 18500)
    }
    
    func testDeductsBasicTaxWithDecimal() throws {
        let net = calc.deductTax(salary: 23000.35)
        XCTAssertEqual(net, 20900.28)
    }
    
    func testDeductHigherRateTax() throws {
        let net = calc.deductTax(salary: 55000)
        XCTAssertEqual(net, 45500)
    }
    
    func testDeductHigherRateTaxWithDecimal() throws {
        let net = calc.deductTax(salary: 62000.47)
        XCTAssertEqual(net, 49700.28)
    }
    
    func testPersonalAllowanceReduction() throws {
        let net = calc.deductTax(salary: 115000)
        XCTAssertEqual(net, 78500)
    }
    
    func testTotalPersonalAllowanceReduction() throws {
        let net = calc.deductTax(salary: 135000)
        XCTAssertEqual(net, 88500)
    }
    
    func testAdditionalRateTax() throws {
        let net = calc.deductTax(salary: 155000)
        XCTAssertEqual(net, 100250)
    }
    
    func testAdditionalRateTaxWithDecimal() throws {
        let net = calc.deductTax(salary: 200000.75)
        XCTAssertEqual(net, 125000.41)
    }
}
