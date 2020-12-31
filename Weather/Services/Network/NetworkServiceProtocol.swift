//
//  NetworkServiceProtocol.swift
//  Weather
//
//  Created by 18579132 on 28.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
	func getCities(cityPrefix: String, completion: @escaping (CityData)-> Void)
	func getWeather(lat: Double, long: Double, completion: @escaping (WeatherData)-> Void)
}
