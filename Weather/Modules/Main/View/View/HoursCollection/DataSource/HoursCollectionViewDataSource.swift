//
//  WeatherCollectionViewDataSource.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class HoursCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	weak var output: HoursCollectionViewDataSourceOutput?

	init(output: HoursCollectionViewDataSourceOutput){
		super.init()
		self.output = output
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		output?.countOfRows() ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.Id.hours.rawValue, for: indexPath) as? HoursCollectionViewCell else { return UICollectionViewCell()}
		if let hour = output?.hour(with: indexPath) {
			cell.configureCell(with: hour)
		}
//		cell.configureCell(with: )
		return cell
	}
}
