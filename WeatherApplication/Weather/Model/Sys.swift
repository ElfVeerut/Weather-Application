//
//  Sys.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct Sys: Codable {
	let type, id: Int
	let country: String
	let sunrise, sunset: Int
}
