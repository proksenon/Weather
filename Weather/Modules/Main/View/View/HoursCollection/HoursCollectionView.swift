//
//  WeatherCollectionView.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class HoursCollectionView: UICollectionView {
	private let flowLayout = HoursCollectionFlowLayout()

	init() {
		super.init(frame: .zero, collectionViewLayout: flowLayout)
		backgroundColor = .clear
		showsHorizontalScrollIndicator = false
		register(HoursCollectionViewCell.self, forCellWithReuseIdentifier: Cells.Id.hours.rawValue)
//		isPagingEnabled = true
		contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
