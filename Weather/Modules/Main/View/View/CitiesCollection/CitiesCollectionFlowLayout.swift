//
//  WeatherCollectionFlowLayout.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CitiesCollectionFlowLayout: UICollectionViewFlowLayout {
	override init() {
		super.init()
		scrollDirection = .horizontal
		minimumLineSpacing = 0
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
