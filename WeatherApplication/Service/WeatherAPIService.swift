//
//  WeatherAPIService.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

final class APIClient {
	
	func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
		let request = URLRequest(resource)
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let `data` = data else {
				result(.failure(APIClientError.noData))
				return
			}
			if let `error` = error {
				result(.failure(error))
				return
			}
			result(.success(data))
		}
		task.resume()
	}
}

class WeatherAPIService {
	
	private let apiClient: APIClient!
	
	init(apiClient:APIClient) {
		self.apiClient = apiClient
	}
	
	func getWeather(cityName: String, completion: @escaping (Result<WeatherData>) -> Void) {
		
		let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=14b164343123ab071149e7a20c45e0bd"
		
		guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
			return
		}
		guard let urlStringResource = URL(string: urlString) else {
			return
		}
		
		let resource = Resource(url: urlStringResource)
				apiClient.load(resource) { (result) in
					switch result {
					case .success(let data):
						do {
							let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
							completion(Result.success(weatherData))
						} catch {
							completion(Result.failure(error))
						}
					case .failure(let error):
						completion(Result.failure(error))
					}
					
				}
	}
	
	func getForecast(cityName: String, completion: @escaping (Result<ForecastData>) -> Void) {
		let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=14b164343123ab071149e7a20c45e0bd"
		
		guard let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
			return
		}
		guard let urlStringResource = URL(string: urlString) else {
			return
		}
		
		let resource = Resource(url: urlStringResource)
		apiClient.load(resource) { (result) in
			switch result {
			case .success(let data):
				do {
					let forecastData = try JSONDecoder().decode(ForecastData.self, from: data)
					completion(Result.success(forecastData))
				} catch {
					completion(Result.failure(error))
				}
			case .failure(let error):
				completion(Result.failure(error))
			}
		}
	}
}
