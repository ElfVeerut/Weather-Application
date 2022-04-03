//
//  CustomViewCell.swift
//  WeatherApp
//
//  Created by Elf Veerut on 3/4/22.
//

import Foundation
import UIKit
import SDWebImage

class CustomViewCell: UITableViewCell {
	
	@IBOutlet weak var dayLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
	
	var timeForecasts: [TimeForecastViewModel] = []
	
	override func awakeFromNib() {
		super.awakeFromNib()
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}

extension CustomViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return timeForecasts.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellReuse", for: indexPath) as! CollectionViewCell
		let timeForecast = timeForecasts[indexPath.row]
		
		let time = timeForecast.time
		let icon = timeForecast.image
		let temp = timeForecast.temp
		cell.timeLabel.text = time
		cell.iconImageView.sd_setImage(with: icon, placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, context: nil)
		cell.tempLabel.text = "\(temp) °C"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 75, height: 75)
	}
}
