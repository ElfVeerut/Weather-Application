//
//  ForecastWorker.swift
//  WeatherApp
//
//  Created by Elf Veerut on 3/4/22.
//

import Foundation

protocol IForecastWorker {
	func getForecast(completion: @escaping (Swift.Result<ForecastData, Error>) -> Void)
}

struct ForecastWorker {
	let forecastAPIService: WeatherAPIService
	var cityName: String
	
	init(cityName: String, forecastAPIService: WeatherAPIService) {
		self.cityName = cityName
		self.forecastAPIService = forecastAPIService
	}
}

extension ForecastWorker: IForecastWorker {
	func getForecast(completion: @escaping (Swift.Result<ForecastData, Error>) -> Void) {
		forecastAPIService.getForecast(cityName: self.cityName, completion: {(result) in
			switch result {
			case .success(let forecastData):
				DispatchQueue.main.async {
					completion(.success(forecastData))
				}
			case .failure(let error):
				DispatchQueue.main.async {
					completion(.failure(error))
				}
			}
		})
	}
}
