//
//  ChangeTemperatureUseCase.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

enum ChangeTemperatureUseCase {
	struct Request {
		var tempType: TempType
	}
	
	struct Response {
		var temperature: Double?
		var tempType: TempType
	}
	
	struct ViewModel {
		var temperture: String
	}
}
