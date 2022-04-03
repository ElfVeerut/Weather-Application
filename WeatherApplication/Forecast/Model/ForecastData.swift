//
//  ForecastData.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastData: Codable {
	let cod: String
	let message, cnt: Int
	let list: [ForecastList]
	let city: ForecastCity
}
