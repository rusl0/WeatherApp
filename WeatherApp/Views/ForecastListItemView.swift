//
//  ForecasrListItemView.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import SwiftUI

struct ForecastListItemView: View {
    
    let day: DayForecast
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(day.condText)
                        }
                        Spacer()
                        Text(temperatureFormatter(value: day.avgTemp))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    VStack(alignment: .leading) {
                        Text("Wind speed: \(numberFormatter(value: day.windSpeed)) kph")
                        Text("Humidity: \(numberFormatter(value: day.humidity))%")
                    }
                }
                .padding()
                .padding(.top,32)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8.0)
            }
            
            HStack(alignment: .bottom) {
                AsyncImage(url: URL(string: "https:\(day.condIcon)"))
                    .frame(width: 64, height: 64)
                    .background(Color.white)
                    .cornerRadius(32)
                    .padding(.leading)
                Spacer()
                Text(day.date)
                    .padding(.trailing)
                    .padding(.bottom,6)
            }
        }
    }
}

struct ForecastListItemView_Previews: PreviewProvider {
    
    static let forecastForDay = DayForecast(
        condText: "Sunny",
        condIcon: "//cdn.weatherapi.com/weather/64x64/day/116.png",
        avgTemp: 13.7, windSpeed: 27.4, humidity: 83, date: "2025-05-23")
    
    static var previews: some View {
        ForecastListItemView(day: forecastForDay)
    }
}
