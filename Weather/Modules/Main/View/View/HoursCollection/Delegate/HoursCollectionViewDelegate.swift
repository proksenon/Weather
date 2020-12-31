//
//  WeatherCollectionViewDelegate.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class HoursCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	weak var output: HoursCollectionViewDelegateOutput?

	init(output: HoursCollectionViewDelegateOutput){
		super.init()
		self.output = output
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 50, height: collectionView.frame.height)
	}

}
