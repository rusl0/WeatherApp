//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @ObservedObject var dataModel = WeatherViewModel()
    @State private var currentCity = "Minsk"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dataModel.forecast.cityName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
            List(dataModel.forecast.days,id: \.date) { day in
                ForecastListItemView(day: day)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .onAppear {
                dataModel.fetchData(for: currentCity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
