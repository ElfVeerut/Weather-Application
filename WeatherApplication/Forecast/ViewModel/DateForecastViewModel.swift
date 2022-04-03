//
//  DateForecastViewModel.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

struct DateForecastViewModel {
	let date: String
	var timeForecasts: [TimeForecastViewModel]
	
	init(dt: Int, timeForecast: [TimeForecastViewModel]) {
		let dateFormat = DateFormatter()
		dateFormat.locale = NSLocale.current
		dateFormat.dateFormat = "EEEE"
		let date = Date(timeIntervalSince1970: TimeInterval(dt))
		let strDate = dateFormat.string(from: date)
		var usedTimeForecast: [TimeForecastViewModel] = []
		
		self.date = strDate
		for item in timeForecast {
			if item.date == strDate {
				usedTimeForecast.append(item)
			}
		}
		self.timeForecasts = usedTimeForecast
	}
}

struct TimeForecastViewModel {
	var date: String?
	let time: String
	var image: URL?
	let temp: String
	
	init(dt: Int, icon: String, temp: Double) {
		let timeFormat = DateFormatter()
		timeFormat.locale = NSLocale.current
		timeFormat.dateFormat = "hh:mm a"
		
		let dateFormat = DateFormatter()
		dateFormat.locale = NSLocale.current
		dateFormat.dateFormat = "EEEE"
		
		let date = Date(timeIntervalSince1970: TimeInterval(dt))
		let strTime = timeFormat.string(from: date)
		let strDate = dateFormat.string(from: date)
		
		let imageURL = "https://openweathermap.org/img/wn/\(icon)@2x.png"
		
		let temperature = temp - Double(273.15)
		let temp2decimal = Double(round(10*temperature)/10)
		
		time = strTime
		image = URL(string: imageURL)
		self.temp = String(temp2decimal)
		self.date = strDate
	}
}
