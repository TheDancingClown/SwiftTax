//
//  Class1NICalculator202021Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class Class1NICalculator202021Tests: XCTestCase {

    let calc = Class1NICalculator202021()
    
    func testNoDeductionUnderPT() {
        let net = calc.class1NI(gross: 500)
        XCTAssertEqual(net, 0.00)
    }
    
    func testDeductionUnderUEL() {
        let net = calc.class1NI(gross: 10000)
        XCTAssertEqual(net, 60)
    }
    
    func testDeductionAboveUEL() {
        let net = calc.class1NI(gross: 60000)
        XCTAssertEqual(net, 5060)
    }
}
