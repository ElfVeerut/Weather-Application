//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct WeatherViewModel {
	let name: String
	let date: String
	let temp: String
	let conditionText: String?
	let conditionIcon: URL?
	let humidity: String
	
	init(name: String, country: String, date: Int, temp: Double, conditionText: String?, conditionIcon: String?, humidity: Int, tempType: TempType) {
		
		let temperature = temp - 273.15
		let imageURL = "https://openweathermap.org/img/wn/\(conditionIcon ?? "")@2x.png"
		
		switch tempType {
		case .celcius:
			let celciusTemperature = Double(round(10*temperature)/10)
			self.temp = "\(String(celciusTemperature)) °C"
			
		case .farenheit:
			let farenheit = temperature * Double(9/5) + Double(32)
			let farenheitTemperature = Double(round(10*farenheit)/10)
			self.temp = "\(String(farenheitTemperature)) °F"
		}
		
		let date = Date(timeIntervalSince1970: TimeInterval(date))
		let dateFormat = DateFormatter()
		dateFormat.locale = NSLocale.current
		dateFormat.dateFormat = "dd MMM yyyy"
		self.date = dateFormat.string(from: date)
		
		self.name = "\(name), \(country)"
		self.conditionText = conditionText
		self.conditionIcon = URL(string: imageURL)
		self.humidity = "Humidity: \(humidity)%"
	}
}
