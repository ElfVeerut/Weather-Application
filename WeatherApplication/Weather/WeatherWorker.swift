//
//  WeatherWorker.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

protocol IWeatherWorker {
	var tempType: TempType { get set }
	var temperture: Double? { get }
	func getWeather(cityName: String, completion: @escaping (Swift.Result<WeatherData, Error>) -> Void)
}

class WeatherWorker {
	
	let weatherAPIService: WeatherAPIService
	var tempType: TempType = .celcius
	var weatherData: WeatherData?
	
	init(weatherAPIService: WeatherAPIService) {
		self.weatherAPIService = weatherAPIService
	}
}

extension WeatherWorker: IWeatherWorker {
	
	var temperture: Double? {
		guard let temp = weatherData?.main.temp else {
			return nil
		}
		let constantTemperature = temp - 273.15
		switch tempType {
		case .celcius:
			let celciusTemperature = Double(round(10*constantTemperature)/10)
			return celciusTemperature
		case .farenheit:
			let farenheit = constantTemperature * Double(9/5) + Double(32)
			let farenheitTemperature = Double(round(10*farenheit)/10)
			return farenheitTemperature
		}
	}
	
	func getWeather(cityName: String, completion: @escaping (Swift.Result<WeatherData, Error>) -> Void) {
		weatherAPIService.getWeather(cityName: cityName, completion: {(result) in
			switch result {
			case .success(let weatherData):
				DispatchQueue.main.async {
					self.weatherData = weatherData
					completion(.success(weatherData))
				}
			case .failure(let error):
				DispatchQueue.main.async {
					completion(.failure(error))
				}
			}
		})
	}
}
