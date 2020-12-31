//
//  WeatherCollectionViewDataSourceOutput.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
protocol HoursCollectionViewDataSourceOutput: AnyObject {
	func hour(with indexPath: IndexPath)->Hour?
	func countOfRows() -> Int
}
