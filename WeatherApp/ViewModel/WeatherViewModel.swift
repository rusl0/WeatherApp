//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ruslan Kandratsenka on 18.05.25.
//

import Foundation
import Combine

final class WeatherViewModel: ObservableObject {
    
    @Published var forecast: Forecast = Forecast()
    private var cancellableSet: Set<AnyCancellable> = []
    
    func fetchData(for city:String) {
        
        guard let url = WeatherAPIEndpoint.forecast(cityName: city).url else {
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .replaceError(with: self.forecast)
            .receive(on: DispatchQueue.main)
            .assign(to: \.forecast, on: self)
            .store(in: &cancellableSet)
    }
}
