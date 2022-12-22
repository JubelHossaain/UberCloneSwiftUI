//
//  Double.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/22/22.
//

import Foundation
extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String{
        return currencyFormatter.string(from: self as NSNumber) ?? ""
    }
}
