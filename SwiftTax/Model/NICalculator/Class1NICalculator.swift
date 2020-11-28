//
//  NICalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class Class1NICalculator {
    
    var nIThresholds = [String: Double]()
    var nIRates = [String: Double]()
    
    func class1NI(gross: Double) -> Double {
        if gross > nIThresholds["UEL"]! {
            return upperNI(gross: gross)
        } else if gross > nIThresholds["PT"]! {
            return basicNI(gross: gross)
        } else {
            return 0.00
        }
    }
    
    private
    
    func primaryNIBand() -> Double {
        return (nIThresholds["UEL"]! - nIThresholds["PT"]!) * nIRates["primary"]!
    }
    
    func upperNI(gross: Double) -> Double {
        let upperNI = (gross - nIThresholds["UEL"]!) * nIRates["upper"]!
        let basicNI = primaryNIBand()
        return upperNI + basicNI
    }
    
    func basicNI(gross: Double) -> Double {
        let NI = (gross - nIThresholds["PT"]!) * nIRates["primary"]!
        return NI
    }
    
}
