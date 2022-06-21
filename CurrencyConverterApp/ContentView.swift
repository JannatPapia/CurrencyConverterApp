//
//  ContentView.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 21/6/22.
//

//  https://api.exchangerate.host/latest?base=USD&amount=1000

import SwiftUI

struct ContentView: View {
    @State var input = "100"
    @State var base = "USD"
    @State var currencyList = [String]()
    @FocusState private var inputIsFocused: Bool
    
    func makeRequest(showAll: Bool, currencies: [String] = ["USD", "GBP", "EUR"]) {
        apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)"){currency in
           // print(currency)
            var tempList = [String]()
            
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                } else if currencies.contains(currency.key) {
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                }
                tempList.sort()
            }
            currencyList.self = tempList
            print(tempList)
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Currencies")
                    .font(.system(size: 30))
                    .bold()
                Image(systemName: "eurosign.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
            List {
                ForEach(currencyList, id: \.self) { currency in
                    Text(currency)
                }
            }
            VStack{
                Rectangle()
                    .frame(height: 8.0)
                    .foregroundColor(Color.green.opacity(0.7))
                    .opacity(0.90)
                TextField("Enter an amount", text: $input)
                    .padding()
                    .foregroundColor(Color.gray)
                    .cornerRadius(20.0)
                    .padding()
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                TextField("Enter a currency", text: $base)
                    .padding()
                    .foregroundColor(Color.gray.opacity(0.50))
                    .cornerRadius(20.0)
                    .padding()
              //      .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                
                Button("Convert!") {
                    makeRequest(showAll: true, currencies: ["BDT", "SEK", "NOK"])
                        inputIsFocused = false
                }.padding()
            }
        }
            .onAppear{
               makeRequest(showAll: true)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
