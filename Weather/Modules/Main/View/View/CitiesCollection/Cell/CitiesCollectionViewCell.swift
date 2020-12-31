//
//  CollectionViewCell.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CitiesCollectionViewCell: UICollectionViewCell {

//	let tableView = FactWeatherTableView()
//	let topHeader = FactTVTopHeaderView()
//	let viewCV = UIView()
//	weak var output:
//	let fonImageView = UIImageView()
	let weatherCollectionView = WeatherCollectionView()
//	let weatherCollectionViewDataSource = WeatherCollectionViewDataSource()
//	let hoursCollection = HoursCollectionView()

//	let hoursDelegate = HoursCollectionViewDelegate()
//	let hoursDataSource = HoursCollectionViewDataSource()

	
	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .clear
//		setupFonImageView()
		setupWeatherCollectionView()
//		setupHoursCollection()
	}

	private func setupWeatherCollectionView() {
		addSubview(weatherCollectionView)
		weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([weatherCollectionView.topAnchor.constraint(equalTo: topAnchor),
									 weatherCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
									 weatherCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
									 weatherCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
	}

//	private func setupHoursCollection() {
//		addSubview(hoursCollection)
//		hoursCollection.translatesAutoresizingMaskIntoConstraints = false
//		NSLayoutConstraint.activate([hoursCollection.topAnchor.constraint(equalTo: topHeader.bottomAnchor),
//									 hoursCollection.leftAnchor.constraint(equalTo: leftAnchor),
//									 hoursCollection.rightAnchor.constraint(equalTo: rightAnchor),
//									 hoursCollection.heightAnchor.constraint(equalToConstant: 150)])
//		hoursCollection.delegate = hoursDelegate
//		hoursCollection.dataSource = hoursDataSource
//	}


	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

