//
//  Double+.swift
//  ByteCoin
//
//  Created by Erkan Sevim on 26.12.2021.
//

import Foundation

extension Double {
    
    /// Converts a double into a currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12,3456
    /// Convert 0,123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
//    private var doubleFormatter2to4: NumberFormatter {
//        let formatter = NumberFormatter()
//        formatter.usesGroupingSeparator = true
//        formatter.numberStyle = .decimal
//        formatter.decimalSeparator = ","
//        formatter.minimumFractionDigits = 2
//        formatter.maximumFractionDigits = 4
//        return formatter
//    }
    
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
//    func min2max4Decimals() -> String {
//        let number = NSNumber(value: self)
//
//        return doubleFormatter2to4.string(from: number) ?? "0.00"
//    }
    
    func asNumberString () -> String {
        return String(format: "%.2f", self)
    }
}
