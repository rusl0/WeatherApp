//
//  WeatherAPIEndpoint.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import Foundation

enum WeatherAPIEndpoint {
    
    private var key: String { return "6b2e5808e178406ab3b164655251605"}
    case forecast(cityName: String)
    
    var url: URL? {
        switch self {
            case .forecast(let name):
                var components = URLComponents()
                components.scheme = "https"
                components.host = "api.weatherapi.com"
                components.path = "/v1/forecast.json"
                components.queryItems = [
                    URLQueryItem(name: "q", value: name),
                    URLQueryItem(name: "days", value: "5"),
                    URLQueryItem(name: "key", value: key)
                ]
                return components.url
        }
    }
}
