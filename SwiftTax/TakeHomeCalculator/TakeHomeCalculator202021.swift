//
//  TakeHomeCalculator202021.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 28/11/2020.
//

import Foundation

class TakeHomeCalculator202021 {
    
    let payeCalc = PayeCalculator202021()
    let class1Calc = Class1NICalculator202021()
    
    func calculateNet(gross: Double) -> Double {
        let paye = payeCalc.paye(gross: gross)
        let ni = class1Calc.class1NI(gross: gross)
        return gross - paye - ni
    }
}
