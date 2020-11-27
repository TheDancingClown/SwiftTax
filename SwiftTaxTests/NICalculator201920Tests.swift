//
//  NICalculator201920Tests.swift
//  SwiftTaxTests
//
//  Created by Louis Kirkham on 27/11/2020.
//

import XCTest
@testable import SwiftTax

class NICalculator201920Tests: XCTestCase {

    let calc = NICalculator()
    
    func testNoDeductionUnderPT() {
        let net = calc.deductNI(gross: 500)
        XCTAssertEqual(net, 500)
    }
    


}
