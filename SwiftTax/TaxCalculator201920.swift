//
//  TaxCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import Foundation

struct TaxCalculator201920 {
    let taxThresholds = ["allowance": 12500.00, "basic": 50000.00]
    let taxRates = ["basic": 0.20, "higher": 0.40]
    
    func deductTax(salary: Double) -> Double {
        if salary > taxThresholds["basic"]! {
            return salary - higherRateTaxDeduction(salary: salary)
        } else if salary > taxThresholds["allowance"]! {
            return salary - basicRateTaxDeduction(salary: salary)
        } else {
        return salary
        }
    }
    
    private
    
    func higherRateTaxDeduction(salary: Double) -> Double {
        let higherRateTaxable = salary - taxThresholds["basic"]!
        let higherRateTax = higherRateTaxable * taxRates["higher"]!
        return higherRateTax + basicBandTax()
    }
    
    func basicRateTaxDeduction(salary: Double) -> Double {
        let basicRateTaxable = salary - taxThresholds["allowance"]!
        return basicRateTaxable * taxRates["basic"]!
    }
    
    func basicBandTax() -> Double {
        let basicBand = taxThresholds["basic"]! - taxThresholds["allowance"]!
        return basicBand * taxRates["basic"]!
    }
}
