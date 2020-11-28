//
//  TakeHomeCalculator201920.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 28/11/2020.
//

import Foundation

class TakeHomeCalculator201920: TakeHomeCalculator {
    
    override init() {
        super.init()
        payeCalc = PayeCalculator201920()
        class1Calc = Class1NICalculator201920()
    }
}
