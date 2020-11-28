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

}
