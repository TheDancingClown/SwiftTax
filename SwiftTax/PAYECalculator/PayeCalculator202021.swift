//
//  TaxCalculator202021.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class PayeCalculator202021: PayeCalculator {
    
    override init() {
        super.init()
        taxThresholds = ["allowance": 12500.00, "basic": 50000.00, "allowanceReduction": 100000.00, "additional": 150000.00]
        taxRates = ["basic": 0.20, "higher": 0.40, "additional": 0.45]
    }
}
