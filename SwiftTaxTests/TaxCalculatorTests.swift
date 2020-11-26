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

    func testNoTaxDeductedUnderTheBasicAllowance() throws {
        let takeHome = calc.deductTax(salary: 10000.35)
        XCTAssertEqual(takeHome, 10000.35)
    }

}
