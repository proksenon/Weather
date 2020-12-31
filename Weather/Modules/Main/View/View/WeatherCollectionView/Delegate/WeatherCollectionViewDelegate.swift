//
//  WeatherCollectionViewDelegate.swift
//  Weather
//
//  Created by 18579132 on 28.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class WeatherCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	weak var output: WeatherCollectionViewDelegateOutput?

	init(output: WeatherCollectionViewDelegateOutput){
		super.init()
		self.output = output
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 100)//100
//		return
	}

	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		let offsetY = scrollView.contentOffset.y
		let headerHeightMaxChange = CGFloat(450 - 150)
		var subOffset: CGFloat = 0
		if offsetY > headerHeightMaxChange {
			subOffset = offsetY - headerHeightMaxChange
		} else {
			subOffset = 0
		}
	}

	func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
		print("sasd")
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		var height: CGFloat = HeaderConstants.HeaderWeather.heightMax
		if section != 0 { // 1
			height = 150
		}
		return CGSize(width: collectionView.frame.width, height: height)
	}
}
