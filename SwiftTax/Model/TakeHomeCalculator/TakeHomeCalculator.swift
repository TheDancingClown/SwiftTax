//
//  TakeHomeCalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 28/11/2020.
//

import Foundation

class TakeHomeCalculator {
    
    var payeCalc = PayeCalculator()
    var class1Calc = Class1NICalculator()
    
    func calculateNet(gross: Double) -> Double {
        let paye = payeCalc.paye(gross: gross)
        let ni = class1Calc.class1NI(gross: gross)
        return gross - paye - ni
    }
}
