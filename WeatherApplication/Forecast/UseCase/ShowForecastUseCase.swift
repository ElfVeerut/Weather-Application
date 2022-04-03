//
//  ShowForecastUseCase.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

enum ShowForecastUseCase {
	struct Request {
		
	}
	
	struct Response {
		var forecastData: ForecastData
	}
	
	struct ViewModel {
		var forecastViewModels: [DateForecastViewModel]
	}
}
