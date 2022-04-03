//
//  ForecastMainclass.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastMainclass: Codable {
	let temp, feelslike, tempMin, tempMax: Double
	let pressure, seaLevel, grndLevel, humidity: Int
	let tempKf: Double
	
	enum CodingKeys: String, CodingKey {
		case temp
		case feelslike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure
		case seaLevel = "sea_level"
		case grndLevel = "grnd_level"
		case humidity
		case tempKf = "temp_kf"
	}
}
