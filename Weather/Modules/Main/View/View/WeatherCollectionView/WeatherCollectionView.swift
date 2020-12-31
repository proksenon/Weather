//
//  CollectionView.swift
//  TestCollection
//
//  Created by 18579132 on 16.12.2020.
//

import UIKit

class WeatherCollectionView: UICollectionView {
	private let flowLayout = WeatherCollectionFlowLayout()

	init() {
		super.init(frame: .zero, collectionViewLayout: flowLayout)
		backgroundColor = .clear
		showsHorizontalScrollIndicator = false
		register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: Cells.Id.weather.rawValue)
		register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Cells.Id.header.rawValue)
		register(SecondHeaderWithHoursCVCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Cells.Id.secondHeader.rawValue)
		alwaysBounceVertical = true
		showsVerticalScrollIndicator = false

	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
