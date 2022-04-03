//
//  ViewController.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import UIKit
import SDWebImage

protocol IWeatherViewController: AnyObject {
	func showWeather(viewModel: GetWeatherCityNameUseCase.ViewModel)
	func showChangeTemp(viewModel: ChangeTemperatureUseCase.ViewModel)
}

class WeatherViewController: UIViewController {

	
	@IBOutlet weak var searchBarView: UIView!
	@IBOutlet weak var searchTextField: UITextField!
	@IBOutlet weak var cityNameLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var conditionImageView: UIImageView!
	@IBOutlet weak var conditionLabel: UILabel!
	@IBOutlet weak var humidityLabel: UILabel!
	@IBOutlet weak var segmentBar: UISegmentedControl!
	
	var interactor: IWeatherInteractor?
	var router: IWeatherRouter?
	var cityName: String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchTextField.delegate = self
		searchBarView.isHidden = true
		searchTextField.placeholder = "Insert City Name"
		getWeather(cityName: "london")
	}

	@IBAction func pressedSearchBar(_ sender: UIButton) {
		if searchBarView.isHidden {
			searchBarView.isHidden = false
		} else {
			searchBarView.isHidden = true
		}
	}
	
	@IBAction func pressedChangeTemp(_ sender: UISegmentedControl) {
		switch segmentBar.selectedSegmentIndex {
		case 0:
			let request = ChangeTemperatureUseCase.Request(tempType: .celcius)
			interactor?.getChangeTemp(request: request)
		case 1:
			let request = ChangeTemperatureUseCase.Request(tempType: .farenheit)
			interactor?.getChangeTemp(request: request)
		default:
			break
		}
	}
	
	@IBAction func pressedToForecastViewController(_ sender: UIButton) {
		if cityName != "" {
			router?.openForecast(viewController: self, cityName: cityName)
		} else {
			router?.openForecast(viewController: self, cityName: "London")
		}
//		if let text = searchTextField.text {
//			if text != "" {
//				router?.openForecast(viewController: self, cityName: text)
//			} else {
//				router?.openForecast(viewController: self, cityName: "London")
//			}
//		}
	}
}

extension WeatherViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		searchTextField.endEditing(true)
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if let text = searchTextField.text {
			getWeather(cityName: text)
			
		}
		
		searchTextField.text = ""
		searchBarView.isHidden = true
	}
}

extension WeatherViewController: IWeatherViewController {
	func showChangeTemp(viewModel: ChangeTemperatureUseCase.ViewModel) {
		tempLabel.text = viewModel.temperture
	}
	
	func showWeather(viewModel: GetWeatherCityNameUseCase.ViewModel) {
		let weatherViewModel = viewModel.weatherViewModel
		
		cityNameLabel.text = weatherViewModel.name
		dateLabel.text = weatherViewModel.date
		tempLabel.text = weatherViewModel.temp
		conditionLabel.text = weatherViewModel.conditionText
		humidityLabel.text = weatherViewModel.humidity
		conditionImageView.sd_setImage(with: weatherViewModel.conditionIcon, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
	}
}

extension WeatherViewController {
	func getWeather(cityName: String) {
		self.cityName = cityName
		let request = GetWeatherCityNameUseCase.Request(cityName: cityName)
		interactor?.getWeather(request: request)
	}
}
