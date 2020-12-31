//
//  WeatherCollectionViewDataSource.swift
//  Weather
//
//  Created by 18579132 on 28.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class WeatherCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	typealias Output = WeatherCollectionViewDataSourceOutput & HoursCollectionViewDataSourceOutput & HoursCollectionViewDelegateOutput
	weak var output: Output?
	let hoursCollectionDelegate: HoursCollectionViewDelegate// = HoursCollectionViewDelegate(output: Output)
	let hoursCollectionDataSource: HoursCollectionViewDataSource// = HoursCollectionViewDataSource(output: Output)

	init(output: Output){
		hoursCollectionDelegate = HoursCollectionViewDelegate(output: output)
		hoursCollectionDataSource = HoursCollectionViewDataSource(output: output)
		self.output = output
		super.init()
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 1 {
			return 0
		} else {
			return 30
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.Id.weather.rawValue, for: indexPath) as? WeatherCollectionViewCell else { return UICollectionViewCell()}
		cell.label.text = "\(indexPath)"
		return cell
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let reusableView: UICollectionReusableView

		if indexPath.section == 0 {
			guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Cells.Id.header.rawValue, for: indexPath) as? CollectionSectionProtocol, let headerWeather = output?.sectionItem(with: indexPath) else { return UICollectionReusableView() }
			headerView.configureCell(with: headerWeather)
			reusableView = headerView
		} else {
			guard let secondHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Cells.Id.secondHeader.rawValue, for: indexPath) as? SecondHeaderWithHoursCVCollectionReusableView else { return UICollectionReusableView() }
			secondHeader.hoursCollectionView.delegate = hoursCollectionDelegate
			secondHeader.hoursCollectionView.dataSource = hoursCollectionDataSource
			reusableView = secondHeader
		}
			return reusableView
	}

}
