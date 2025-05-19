//
//  Formatters.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import Foundation

func temperatureFormatter(value: Double) ->  String {
    let measure = Measurement(value: value, unit: UnitTemperature.celsius)
    let formatter = MeasurementFormatter()
    formatter.unitStyle = .short
    formatter.numberFormatter.maximumFractionDigits = 1
    formatter.unitOptions = .temperatureWithoutUnit
    return formatter.string(from: measure)
}

func numberFormatter(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 1
    return formatter.string(from: NSNumber(value: value)) ?? "0"
}
 
