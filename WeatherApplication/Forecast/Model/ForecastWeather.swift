//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastWeather: Codable {
	let id: Int
	let main: String
	let description: String
	let icon: String
	
	enum CodingKeys: String, CodingKey {
		case id, main
		case description = "description"
		case icon
	}
}

enum Icon: String, Codable {
	case the04D = "04d"
	case the04N = "04n"
	case the10D = "10d"
	case the10N = "10n"
}

enum Description: String, Codable {
	case lightRain = "light rain"
	case moderateRain = "moderate rain"
	case overcastClouds = "overcast clouds"
}
