//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation

protocol IWeatherPresenter {
	func presentWeather(response: GetWeatherCityNameUseCase.Response)
	func presentTemperature(response: ChangeTemperatureUseCase.Response)
}

struct WeatherPresenter {
	weak var viewController: IWeatherViewController?
	
	init(viewController: IWeatherViewController) {
		self.viewController = viewController
	}
}

extension WeatherPresenter: IWeatherPresenter {
	func presentWeather(response: GetWeatherCityNameUseCase.Response) {
		let weatherViewModel = WeatherViewModel(name: response.weatherData.name,
												country: response.weatherData.sys.country,
												date: response.weatherData.dt,
												temp: response.weatherData.main.temp,
												conditionText: response.weatherData.weather.first?.main,
												conditionIcon: response.weatherData.weather.first?.icon,
												humidity: response.weatherData.main.humidity,
												tempType: response.tempType)
		let viewModel = GetWeatherCityNameUseCase.ViewModel(weatherViewModel: weatherViewModel)
		viewController?.showWeather(viewModel: viewModel)
	}
	
	func presentTemperature(response: ChangeTemperatureUseCase.Response) {
		guard let temperature = response.temperature else {
			return
		}
		var temperatureString: String = "-"
		switch response.tempType {
		case .celcius:
			temperatureString = "\(String(temperature)) °C"
		case .farenheit:
			temperatureString = "\(String(temperature)) °F"
		}
		
		let viewModel = ChangeTemperatureUseCase.ViewModel(temperture: temperatureString)
		viewController?.showChangeTemp(viewModel: viewModel)
	}
}
