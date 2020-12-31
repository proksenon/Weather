//
//  NameInteractorInput.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol MainInteractorInput: class {
	func getLocation()->(lat: Double?, long: Double?)
	func getCities(cityPrefix: String, completion: @escaping (CityData)-> Void)
	func getWeather(lat: Double, long: Double, completion: @escaping (WeatherData)-> Void)
}
