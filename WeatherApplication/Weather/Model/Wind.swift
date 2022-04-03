//
//  Wind.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct Wind: Codable {
	let speed: Double
	let deg: Int
	let gust: Double?
}
