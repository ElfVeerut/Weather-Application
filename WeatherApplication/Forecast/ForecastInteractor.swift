//
//  ForecastInteractor.swift
//  WeatherApp
//
//  Created by Elf Veerut on 3/4/22.
//

import Foundation

protocol IForecastInteractor {
	func getForecast()
}

struct ForecastInteractor {
	let presenter: IForecastPresenter
	var worker: IForecastWorker
	
	init(presenter: IForecastPresenter, worker: IForecastWorker) {
		self.presenter = presenter
		self.worker = worker
	}
}

extension ForecastInteractor: IForecastInteractor {
	func getForecast() {
		worker.getForecast { result in
			switch result {
			case .success(let forecastData):
				let response = ShowForecastUseCase.Response(forecastData: forecastData)
				presenter.presentForecast(response: response)
			case .failure(let error):
				print(error)
			}
		}
	}
}
