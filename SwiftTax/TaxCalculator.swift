//
//  TaxCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import Foundation

struct TaxCalculator {
    let taxThresholds = ["allowance": 12500.00, "basic": 50000.00]
    let taxBands = ["basic": 37500.00]
    let taxRates = ["basic": 0.20, "higher": 0.40]
    
    func deductTax(salary: Double) -> Double {
        if salary > taxThresholds["basic"]! {
            let taxable = salary - taxThresholds["basic"]!
            let higherTax = taxable * taxRates["higher"]!
            let basicTax = taxBands["basic"]! * taxRates["basic"]!
            return (salary-basicTax-higherTax)
        } else if salary > taxThresholds["allowance"]! {
            let taxable = salary - taxThresholds["allowance"]!
            let tax = taxable * taxRates["basic"]!
            return (salary-tax)
        } else {
        return salary
        }
    }
}
