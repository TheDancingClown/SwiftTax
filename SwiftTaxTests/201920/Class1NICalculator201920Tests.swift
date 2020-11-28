//
//  NICalculator201920Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class Class1NICalculator201920Tests: XCTestCase {

    let calc = Class1NICalculator201920()
    
    func testNoDeductionUnderPT() {
        let net = calc.class1NI(gross: 500)
        XCTAssertEqual(net, 0.00)
    }
    
    func testDeductionUnderUEL() {
        let net = calc.class1NI(gross: 9000)
        XCTAssertEqual(net, 44.16)
    }
    
    func testDeductionAboveUEL() {
        let net = calc.class1NI(gross: 60000)
        XCTAssertEqual(net, 5164.16)
    }
    
}
