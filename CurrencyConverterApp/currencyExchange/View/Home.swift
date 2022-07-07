////
//  SwiftUIView.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 2/7/22.
//

//import SwiftUI
//
//struct Home: View {
//
//    @StateObject var viewModel = FetchData()
//
//    var body: some View {
//
//        VStack {
//            if viewModel.conversionData.isEmpty{
//
//                ProgressView()
//            }
//            else{
//                ScrollView {
//                    //Fetching Data......
//
//                    LazyVStack(alignment: .leading, spacing: 15, content: {
//                        ForEach(viewModel.conversionData){rate in
//
//                            HStack(spacing: 15) {
//
//                                Text(getFlag(currency: rate.currencyName ))
//                                    .font(.system(size: 65))
//
//                                VStack(alignment: .leading, spacing: 5, content: {
//                                    Text(rate.currencyName)
//                                        .font(.title)
//                                        .fontWeight(.bold)
//
//                                    Text("\(rate.currencyValue)")
//                                        .fontWeight(.heavy)
//                                })
//
//
//
//                            }.padding(.horizontal)
//                        }
//                    })
//                    .padding(.top)
//                }
//            }
//        }
//    }
//
////    getting country flag by currency name....
//
//    func getFlag(currency: String) -> String{
//
//        let base = 127397
//
//        var code = currency
//        code.removeAll()
//
//        var scalar = String.UnicodeScalarView()
//
//        for i in currency.utf16{
//            scalar.append(UnicodeScalar(base + Int(i))!)
//        }
//        return String(scalar)
//    }
//}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
