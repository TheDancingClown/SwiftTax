//
//  TaxCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import Foundation

struct TaxCalculator {
    
    func deductTax(salary: Double) -> Double {
        if salary > 12500 {
            let taxable = salary - 12500
            let tax = taxable * 20/100
            return (salary-tax)
        } else {
        return salary
        }
    }
}
