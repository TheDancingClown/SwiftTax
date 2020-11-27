//
//  Class1NICalculator201920.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class Class1NICalculator201920: Class1NICalculator {
    
    override init() {
        super.init()
        NIThresholds = ["PT": 8632.00, "UEL": 50000.00]
        NIRates = ["primary": 0.12, "upper": 0.02]
    }
}
