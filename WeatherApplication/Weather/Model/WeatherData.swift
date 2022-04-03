//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct WeatherData: Codable {
	let coord: Coord
	let weather: [Weather]
	let base: String
	let main: Main
	let visibility: Int
	let wind: Wind?
	let clouds: Clouds
	let dt: Int
	let sys: Sys
	let timezone, id: Int
	let name: String
	let cod: Int
}
