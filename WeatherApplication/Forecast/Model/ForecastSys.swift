//
//  ForecastSys.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastSys: Codable {
	let pod: Pod
}

enum Pod: String, Codable {
	case d = "d"
	case n = "n"
}
