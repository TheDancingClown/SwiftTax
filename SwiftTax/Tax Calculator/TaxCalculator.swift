//
//  TaxCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import Foundation

class TaxCalculator {
    
    var taxThresholds = [String: Double]()
    var taxRates = [String: Double]()
    
    func PAYE(gross: Double) -> Double {
        if gross > taxThresholds["additional"]! {
            return additionalRateTax(gross: gross)
        } else if gross > taxThresholds["allowanceReduction"]! {
            return higherRateWithAllowanceReduction(gross: gross)
        } else if gross > taxThresholds["basic"]! {
            return higherRateTax(gross: gross)
        } else if gross > taxThresholds["allowance"]! {
            return basicRateTax(gross: gross)
        } else {
            return 0.00
        }
    }
    
    private
    
    func additionalRateTax(gross: Double) -> Double {
        let additionalRateTaxable = gross - taxThresholds["additional"]!,
            additionalRateTax = additionalRateTaxable * taxRates["additional"]!
        return rounding(tax: additionalRateTax + basicBandTax()) + higherBandTax()
    }
    
    func higherRateWithAllowanceReduction(gross: Double) -> Double {
        let reducedAllowance = reducePersonalAllowance(gross: gross),
            higherRateTaxable = gross - taxThresholds["basic"]! + reducedAllowance,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func higherRateTax(gross: Double) -> Double {
        let higherRateTaxable = gross - taxThresholds["basic"]!,
            higherRateTax = higherRateTaxable * taxRates["higher"]!
        return rounding(tax: higherRateTax + basicBandTax())
    }
    
    func basicRateTax(gross: Double) -> Double {
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
