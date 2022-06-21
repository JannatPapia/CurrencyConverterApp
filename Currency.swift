//
//  Currency.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 21/6/22.
//
// https://api.exchangerate.host/latest?base=USD&amount=1000

import Foundation
import Alamofire

struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}


func apiRequest(url: String, completion: @escaping (Currency) -> ()) {
    
    Session.default.request(url).responseDecodable(of: Currency.self) {response in
        switch response.result{
        case.success(let currencies):
            print(currencies)
            completion(currencies)
        case.failure(let error):
            print(error)
        }
    }
}







