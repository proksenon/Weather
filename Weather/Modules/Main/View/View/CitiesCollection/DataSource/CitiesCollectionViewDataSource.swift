//
//  WeatherCollectionViewDataSource.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class CitiesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	typealias CollectionsOutput = CitiesCollectionViewDataSourceOutput
		& WeatherCollectionViewDataSourceOutput
		& WeatherCollectionViewDelegateOutput
	& HoursCollectionViewDelegateOutput
	& HoursCollectionViewDataSourceOutput

	weak var output: CitiesCollectionViewDataSourceOutput?
	let weatherCollectionDataSource: WeatherCollectionViewDataSource
	let weatherCollectionDelegate: WeatherCollectionViewDelegate

	init(output: CollectionsOutput){
		self.output = output
		weatherCollectionDataSource = WeatherCollectionViewDataSource(output: output)
		weatherCollectionDelegate = WeatherCollectionViewDelegate(output: output)
		super.init()
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		4
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.Id.cities.rawValue, for: indexPath) as? CitiesCollectionViewCell else { return UICollectionViewCell() }
		print(indexPath)
		cell.weatherCollectionView.delegate = weatherCollectionDelegate
		cell.weatherCollectionView.dataSource = weatherCollectionDataSource
		return cell

	}
}
