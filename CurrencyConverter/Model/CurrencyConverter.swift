//
//  CurrencyConverter.swift
//  CurrencyConverter
//
//  Created by Maor Niv on 2/17/24.
//

// CurrencyConverter.swift

import Foundation

class CurrencyConverter {

    static func getConversionRates() -> [Double] {
        // Update conversion rates for Euro, Pound, Yen, and Swiss Franc
        return [0.9, 0.75, 110.0, 1.05]
    }

    static func currencySymbol(forIndex index: Int) -> String {
        switch index {
        case 0:
            return "€"
        case 1:
            return "£"
        case 2:
            return "¥"
        case 3:
            return "CHF"
        default:
            return "$"
        }
    }
}
