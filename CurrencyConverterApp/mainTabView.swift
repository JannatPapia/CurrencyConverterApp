//
//  mainTabView.swift
//  CurrencyConverterApp
//
//  Created by Jannatun Nahar Papia on 1/7/22.
//

import SwiftUI

struct mainTabView: View {
    var body: some View {
        TabView {
                    ContentView()
                        .tabItem {
                            Label("Menu", systemImage: "list.dash")
                        }

                      CurrencyView()
                        .tabItem {
                            Label("Order", systemImage: "square.and.pencil")
                        }
                }
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}
