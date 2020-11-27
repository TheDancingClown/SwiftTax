//
//  TaxCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import Foundation

struct TaxCalculator {
    let taxThresholds = ["allowance": 12500.00, "basic": 50000.00, "allowanceReduction": 100000.00, "additional": 150000.00]
    let taxRates = ["basic": 0.20, "higher": 0.40, "additional": 0.45]
    
    func deductTax(salary: Double) -> Double {
        if salary > taxThresholds["additional"]! {
            return salary - additionalRateTaxDeduction(salary: salary)
        } else if salary > taxThresholds["allowanceReduction"]! {
            return salary - higherRateWithAllowanceDeduction(salary: salary)
        } else if salary > taxThresholds["basic"]! {
            return salary - higherRateTaxDeduction(salary: salary)
        } else if salary > taxThresholds["allowance"]! {
            return salary - basicRateTaxDeduction(salary: salary)
        } else {
          return salary
        }
    }
    
    private
    
    func additionalRateTaxDeduction(salary: Double) -> Double {
        let additionalRateTaxable = salary - taxThresholds["additional"]!,
            additionalRateTax = additionalRateTaxable * taxRates["additional"]!
        return rounding(tax: additionalRateTax + basicBandTax()) + higherBandTax()
    }
    
    func higherRateWithAllowanceDeduction(salary: Double) -> Double {
        let reducedAllowance = reducePersonalAllowance(salary: salary),
            higherRateTaxable = salary - taxThresholds["basic"]! + reducedAllowance,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func higherRateTaxDeduction(salary: Double) -> Double {
        let higherRateTaxable = salary - taxThresholds["basic"]!,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func basicRateTaxDeduction(salary: Double) -> Double {
        let basicRateTaxable = salary - taxThresholds["allowance"]!
        return rounding(tax: basicRateTaxable * taxRates["basic"]!)
    }
    
    func higherBandTax() -> Double {
        let higherBand = taxThresholds["additional"]! - taxThresholds["basic"]! + taxThresholds["allowance"]!
        return rounding(tax: higherBand * taxRates["higher"]!)
    }
    
    func basicBandTax() -> Double {
        let basicBand = taxThresholds["basic"]! - taxThresholds["allowance"]!
        return rounding(tax: basicBand * taxRates["basic"]!)
    }
    
    func reducePersonalAllowance(salary: Double) -> Double {
        var reducedAllowance = taxThresholds["allowance"]
        for _ in stride(from: taxThresholds["allowanceReduction"]!, to: salary, by: 2) {
            if reducedAllowance! >= 1 {
                reducedAllowance! -= 1
            }
        }
        return taxThresholds["allowance"]! - reducedAllowance!
    }
    
    func rounding(tax: Double) -> Double {
        return (tax*100).rounded()/100
    }
}
