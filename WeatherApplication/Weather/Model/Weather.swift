//
//  Weather.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct Weather: Codable {
	let id: Int
	let main, weatherDescription, icon: String
	
	enum CodingKeys: String, CodingKey {
		case id, main
		case weatherDescription = "description"
		case icon
	}
}
