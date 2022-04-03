//
//  ForecaseViewController.swift
//  WeatherApp
//
//  Created by Elf Veerut on 2/4/22.
//

import UIKit

protocol IForecastViewController: AnyObject{
	func showWeather(viewModel: ShowForecastUseCase.ViewModel)
}

class ForecastViewController: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	
	var interactor: IForecastInteractor?
	
	var dateForecasts: [DateForecastViewModel] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		interactor?.getForecast()
	}
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dateForecasts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomViewCell
		let dateForecast = dateForecasts[indexPath.row]
		
		let dayText = dateForecast.date
		let date = dateForecast.timeForecasts
		cell.dayLabel.text = dayText
		cell.timeForecasts = date
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 160
	}
}

extension ForecastViewController: IForecastViewController {
	func showWeather(viewModel: ShowForecastUseCase.ViewModel) {
		self.dateForecasts = viewModel.forecastViewModels
		tableView.reloadData()
	}
}
