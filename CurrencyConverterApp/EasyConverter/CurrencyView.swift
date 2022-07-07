//
//  CurrencyView.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 22/6/22.
//

import SwiftUI

struct CurrencyView: View {
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount: String = ""
    private let currencies = ["USD", "EUR", "GBP"]
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        var amount = Double(convert.doubleValue) ?? 0.0
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        
        let euroRates = ["USD": 1.15, "EUR": 1.0, "GBP": 0.84]
        let usdRates = ["USD": 1.0, "EUR": 0.87, "GBP": 0.73]
        let gbpRates = ["USD": 1.37, "EUR": 1.18, "GBP": 1.0]
        
        switch(selectedCurrency) {
        case "USD" :
            conversion = amount * (usdRates[to] ?? 0.0)
        case "EUR" :
            conversion = amount * (euroRates[to] ?? 0.0)
        case "GBP" :
            conversion = amount * (usdRates[to] ?? 0.0)
        default:
            print("Something went Wrong!")
        }
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Convert a currency")
                    .bold()
                //    .fontWeight(bold())
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                        
                )
                {
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $itemSelected, label: Text("From")) {
                        ForEach(0 ..< currencies.count) {index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                    
                    Picker(selection: $itemSelected2, label: Text("To")) {
                        ForEach(0 ..< currencies.count) {index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                Section(header: Text("Conversion")) {
                    Text("\(convert(amount)) \(currencies[itemSelected2])")
                }
            }
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
