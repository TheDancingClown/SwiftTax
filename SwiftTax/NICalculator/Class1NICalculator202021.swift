//
//  Class1NICalculator202021.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class Class1NICalculator202021: Class1NICalculator {
    
    override init() {
        super.init()
        nIThresholds = ["PT": 9500.00, "UEL": 50000.00]
        nIRates = ["primary": 0.12, "upper": 0.02]
    }
}
