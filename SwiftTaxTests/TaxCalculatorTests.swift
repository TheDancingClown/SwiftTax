//
//  TaxCalculatorTests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 26/11/2020.
//

import XCTest
@testable import SwiftTax

class TaxCalculatorTests: XCTestCase {
    
    let calc = TaxCalculator()

    func testNoTaxDeductedUnderThePersonalAllowance() throws {
        let net = calc.deductTax(salary: 10000.35)
        XCTAssertEqual(net, 10000.35)
    }
    
    func testDeductsBasicTax() throws {
        let net = calc.deductTax(salary: 20000)
        XCTAssertEqual(net, 18500)
    }
    
    func testDeductHigherRateTax() throws {
        let net = calc.deductTax(salary: 55000)
        XCTAssertEqual(net, 45500)
    }

}
