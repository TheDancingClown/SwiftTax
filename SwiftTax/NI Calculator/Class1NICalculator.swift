//
//  NICalculator.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 27/11/2020.
//

import Foundation

class Class1NICalculator {
    
    var NIThresholds = [String: Double]()
    var NIRates = [String: Double]()
    
    func Class1NI(gross: Double) -> Double {
        if gross > NIThresholds["UEL"]! {
            return upperNI(gross: gross)
        }
        if gross > NIThresholds["PT"]! {
            return basicNI(gross: gross)
        } else {
        return gross
        }
    }
    
    private
    
    func primaryNIBand() -> Double {
        return (NIThresholds["UEL"]! - NIThresholds["PT"]!) * NIRates["primary"]!
    }
    
    func upperNI(gross: Double) -> Double {
        let upperNI = (gross - NIThresholds["UEL"]!) * NIRates["upper"]!
        let basicNI = primaryNIBand()
        return upperNI + basicNI
    }
    
    func basicNI(gross: Double) -> Double {
        let NI = (gross - NIThresholds["PT"]!) * NIRates["primary"]!
        return NI
    }
    
}
