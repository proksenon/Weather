//
//  WeatherCollectionView.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CitiesCollectionView: UICollectionView {
	private let flowLayout = CitiesCollectionFlowLayout()

	init() {
		super.init(frame: .zero, collectionViewLayout: flowLayout)
		backgroundColor = .clear
		showsHorizontalScrollIndicator = false
		register(CitiesCollectionViewCell.self, forCellWithReuseIdentifier: Cells.Id.cities.rawValue)
		isPagingEnabled = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
