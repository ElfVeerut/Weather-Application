//
//  ForecastList.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastList: Codable {
	let dt: Int
	let main: ForecastMainclass
	let weather: [ForecastWeather]
	let clouds: ForecastClouds
	let wind: ForecastWind
	let visibility: Int
	let pop: Double
	let rain: ForecastRain?
	let sys: ForecastSys
	let dtTxt: String
	
	enum CodingKeys: String, CodingKey {
		case dt, main, weather, clouds, wind, visibility, pop, rain, sys
		case dtTxt = "dt_txt"
	}
}
