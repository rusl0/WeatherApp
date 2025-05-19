//
//  DayForecast.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import Foundation

struct DayForecast: Decodable {
    let condText: String
    let condIcon: String
    let avgTemp: Double
    let windSpeed: Double
    let humidity: Double
    let date: String
}

extension DayForecast {
    enum CodingKeys: String, CodingKey {
        case date
        case day
        enum DayKeys: String, CodingKey {
            case avgTemp = "avgtemp_c"
            case windSpeed = "maxwind_kph"
            case humidity = "avghumidity"
            case condition
            enum CoonditionKeys: String, CodingKey {
                case condText = "text"
                case condIcon = "icon"
            }
        }
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)

        let dayContainer = try container.nestedContainer(
            keyedBy: CodingKeys.DayKeys.self, forKey: .day)
        self.avgTemp = try dayContainer.decode(Double.self, forKey: .avgTemp)
        self.windSpeed = try dayContainer.decode(Double.self, forKey: .windSpeed)
        self.humidity = try dayContainer.decode(Double.self, forKey: .humidity)

        let condContainer = try dayContainer.nestedContainer(
            keyedBy: CodingKeys.DayKeys.CoonditionKeys.self, forKey: .condition)
        self.condText = try condContainer.decode(String.self, forKey: .condText)
        self.condIcon = try condContainer.decode(String.self, forKey: .condIcon)
    }
}
