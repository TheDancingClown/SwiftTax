//
//  TakeHomeCalculator201920.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 28/11/2020.
//

import Foundation

class TakeHomeCalculator201920 {
    
    let payeCalc = PayeCalculator201920()
    let class1Calc = Class1NICalculator201920()
    
    func calculateNet(gross: Double) -> Double {
        let paye = payeCalc.paye(gross: gross)
        let ni = class1Calc.class1NI(gross: gross)
        return gross - paye - ni
    }
}
