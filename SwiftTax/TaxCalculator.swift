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
    
    func deductTax(gross: Double) -> Double {
        if gross > taxThresholds["additional"]! {
            return gross - additionalRateTaxDeduction(gross: gross)
        } else if gross > taxThresholds["allowanceReduction"]! {
            return gross - higherRateWithAllowanceDeduction(gross: gross)
        } else if gross > taxThresholds["basic"]! {
            return gross - higherRateTaxDeduction(gross: gross)
        } else if gross > taxThresholds["allowance"]! {
            return gross - basicRateTaxDeduction(gross: gross)
        } else {
          return gross
        }
    }
    
    private
    
    func additionalRateTaxDeduction(gross: Double) -> Double {
        let additionalRateTaxable = gross - taxThresholds["additional"]!,
            additionalRateTax = additionalRateTaxable * taxRates["additional"]!
        return rounding(tax: additionalRateTax + basicBandTax()) + higherBandTax()
    }
    
    func higherRateWithAllowanceDeduction(gross: Double) -> Double {
        let reducedAllowance = reducePersonalAllowance(gross: gross),
            higherRateTaxable = gross - taxThresholds["basic"]! + reducedAllowance,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func higherRateTaxDeduction(gross: Double) -> Double {
        let higherRateTaxable = gross - taxThresholds["basic"]!,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func basicRateTaxDeduction(gross: Double) -> Double {
        let basicRateTaxable = gross - taxThresholds["allowance"]!
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
    
    func reducePersonalAllowance(gross: Double) -> Double {
        var reducedAllowance = taxThresholds["allowance"]
        for _ in stride(from: taxThresholds["allowanceReduction"]!, to: gross, by: 2) {
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
