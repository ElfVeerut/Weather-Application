//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Elf Veerut on 3/4/22.
//

import Foundation

protocol IForecastPresenter {
	func presentForecast(response: ShowForecastUseCase.Response)
}

class ForecastPresenter {
	weak var viewController: IForecastViewController?
	var dateForecasts: [DateForecastViewModel] = []
	
	init(viewController: IForecastViewController) {
		self.viewController = viewController
	}
}

extension ForecastPresenter: IForecastPresenter {
	func presentForecast(response: ShowForecastUseCase.Response) {
		let forecastAPIList = response.forecastData
		
		var timeForecasts: [TimeForecastViewModel] = []
		
		for item in forecastAPIList.list {
			timeForecasts.append(TimeForecastViewModel(dt: item.dt, icon: item.weather[0].icon, temp: item.main.temp))
		}
		
		for i in 0..<forecastAPIList.list.count {
			var isAdded = false
			let temp = DateForecastViewModel(dt: forecastAPIList.list[i].dt, timeForecast: timeForecasts)
			
			if i == 0 {
				dateForecasts.append(temp)
			}
			for var day in dateForecasts {
				if day.date == temp.date {
					isAdded = true
					day.timeForecasts.append(temp.timeForecasts[0])
				}
			}
			if !isAdded {
				dateForecasts.append(temp)
			}
		}
		let viewModel = ShowForecastUseCase.ViewModel(forecastViewModels: dateForecasts)
		viewController?.showWeather(viewModel: viewModel)
	}
}
