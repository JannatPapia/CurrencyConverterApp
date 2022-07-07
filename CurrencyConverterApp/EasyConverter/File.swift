//
//  File.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 22/6/22.
//

import Foundation

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
        }
        }
        return 0
    }
}
