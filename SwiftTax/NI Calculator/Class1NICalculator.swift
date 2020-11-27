//
//  NICalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class Class1NICalculator {
    
    func deductNI(gross: Double) -> Double {
        if gross > 8632 {
            let NI = (gross - 8632) * 0.12
            return NI
        } else {
        return gross
        }
    }
    
}
