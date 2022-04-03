//
//  ForecastRain.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct ForecastRain: Codable {
	let the3H: Double
	
	enum CodingKeys: String, CodingKey {
		case the3H = "3h"
	}
}
