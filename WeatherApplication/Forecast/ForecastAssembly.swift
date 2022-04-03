//
//  ForecastAssembly.swift
//  WeatherApp
//
//  Created by Elf Veerut on 3/4/22.
//

import Foundation
import UIKit

protocol IForecastAssembly {
	func build(cityName: String) -> UIViewController
}

struct ForecastAssembly {
	
}

extension ForecastAssembly: IForecastAssembly {
	func build(cityName: String) -> UIViewController {
		let storyboard = UIStoryboard(name: "Forecast", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "ForecastViewControllerID") as! ForecastViewController
		
		let forecastAPI = WeatherAPIService(apiClient: APIClient())
		
		let worker = ForecastWorker(cityName: cityName, forecastAPIService: forecastAPI)
		let presenter = ForecastPresenter(viewController: viewController)
		
		let interactor = ForecastInteractor(presenter: presenter, worker: worker)
		
		viewController.interactor = interactor
		
		return viewController
	}
}
