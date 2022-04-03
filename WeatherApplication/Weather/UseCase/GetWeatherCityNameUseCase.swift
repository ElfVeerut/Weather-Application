//
//  GetWeatherCityNameUseCase.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation
enum GetWeatherCityNameUseCase {
	
	struct Request {
		var cityName: String
	}
	
	struct Response {
		var weatherData: WeatherData
		var tempType: TempType
	}
	
	struct ViewModel {
		var weatherViewModel: WeatherViewModel
	}
}
