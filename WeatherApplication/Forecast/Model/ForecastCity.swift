//
//  ForecastCity.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastCity: Codable {
	let id: Int
	let name: String
	let coord: ForecastCoord
	let country: String
	let population, timezone, sunrise, sunset: Int
}
