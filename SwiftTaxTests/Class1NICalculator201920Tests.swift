//
//  NICalculator201920Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class Class1NICalculator201920Tests: XCTestCase {

    let calc = Class1NICalculator()
    
    func testNoDeductionUnderPT() {
        let net = calc.deductNI(gross: 500)
        XCTAssertEqual(net, 500)
    }
    
    func testDeductionUnderUEL() {
        let net = calc.deductNI(gross: 9000)
        XCTAssertEqual(net, 44.16)
    }

}
