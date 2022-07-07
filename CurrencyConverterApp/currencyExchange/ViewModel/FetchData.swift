////
////  FetchData.swift
////  CurrencyConverterApp
////
////  Created by Jannatun Nahar Papia on 2/7/22.
////
//
//import SwiftUI
//
//class FetchData: ObservableObject {
//   
//    @Published var conversionData: [Currency] = []
//    
//    init() {
//        fetch()
//    }
//    
//    func fetch() {
//        let url = "https://api.exchangeratesapi.io/latest?base=USD"
//        
//        let session = URLSession(configuration: .default)
//        
//        session.dataTask(with: URL(string: url)!) { (data, _, _) in
//            guard let JSONData = data else{return}
//            
//            do{
//                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONData)
//                
//                // Converting Dictionary To Array of Object....
//                
//                DispatchQueue.main.async {
//                    // Key Will be Currency Name
//                    // Value Will be currency Value...
//                    self.conversionData = conversion.rates.compactMap({ (key, value)
//                        -> Currency? in
//                        
//                        return Currency(currencyName: key, currencyValue: value)
//                    })
//                }
//  //              print(conversion)
//            }
//            
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//        .resume()
//    }
//}
//
//
