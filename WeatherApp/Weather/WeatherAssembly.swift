//
//  WeatherAssembly.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation
import UIKit

protocol IWeatherAssembly {
	func build() -> UIViewController
}

struct WeatherAssembly {
	
}

extension WeatherAssembly: IWeatherAssembly {
	func build() -> UIViewController {
		let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		
		let viewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewControllerID") as! WeatherViewController
		let weatherAPI = WeatherAPIService(apiClient: APIClient())
		
		let presenter = WeatherPresenter(viewController: viewController)
		let worker = WeatherWorker(weatherAPIService: weatherAPI)
		
		let interactor = WeatherInteractor(presenter: presenter, worker: worker)
		let router = WeatherRouter()
		
		viewController.interactor = interactor
		viewController.router = router
		
		let navigationViewController = UINavigationController()
		navigationViewController.viewControllers = [viewController]
		
		return navigationViewController
	}
}
