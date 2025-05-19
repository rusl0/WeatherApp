//
//  Forecasr.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import Foundation

struct Forecast: Decodable {
    let cityName: String
    let days: [DayForecast]
    
    init() {
        self.cityName = ""
        self.days = []
    }
}

extension Forecast {
    enum CodingKeys: String, CodingKey {
        case location
        enum LocationKeys: String, CodingKey {
            case name
        }
        case forecast
        enum ForecastKeys: String, CodingKey {
            case forecastday
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.LocationKeys.self, forKey: .location)
        self.cityName = try locationContainer.decode(String.self, forKey: .name)
        
        let daysContainer = try container.nestedContainer(
            keyedBy: CodingKeys.ForecastKeys.self, forKey: .forecast)
        self.days = try daysContainer.decode([DayForecast].self, forKey: .forecastday)
    }
}
