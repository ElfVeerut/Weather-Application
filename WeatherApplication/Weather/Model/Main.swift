//
//  Main.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct Main: Codable {
	let temp, feelsLike, tempMin, tempMax: Double
	let pressure, humidity: Int
	
	enum CodingKeys: String, CodingKey {
		case temp
		case feelsLike = "feels_like"
		case tempMin = "temp_min"
		case tempMax = "temp_max"
		case pressure, humidity
	}
}
