//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import Foundation
import UIKit

protocol IWeatherRouter {
	func openForecast(viewController: UIViewController, cityName: String)
}

struct WeatherRouter {
	
}

extension WeatherRouter: IWeatherRouter {
	func openForecast(viewController: UIViewController, cityName: String) {
		let forecastViewController = ForecastAssembly().build(cityName: cityName)
		viewController.navigationController?.pushViewController(forecastViewController, animated: true)
	}
}
