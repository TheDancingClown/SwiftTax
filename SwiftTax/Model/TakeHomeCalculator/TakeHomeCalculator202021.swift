//
//  TakeHomeCalculator202021.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 28/11/2020.
//

import Foundation

class TakeHomeCalculator202021: TakeHomeCalculator {
    
    override init() {
        super.init()
        payeCalc = PayeCalculator202021()
        class1Calc = Class1NICalculator202021()
    }
    
}
