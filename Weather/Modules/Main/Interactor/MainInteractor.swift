//
//  TreatmentTransactionInteractor.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class MainInteractor {

	weak var output: MainInteractorOutput?
	let networkService: NetworkServiceProtocol
	let locationService: LocationServiceProtocol

	init(presenter: MainInteractorOutput, networkService: NetworkServiceProtocol = NetworkService(),
		 locationService: LocationServiceProtocol = LocationService()) {
		self.output = presenter
		self.networkService = networkService
		self.locationService = locationService
	}

}
extension MainInteractor: MainInteractorInput {
	func getLocation()->(lat: Double?, long: Double?) {
		return locationService.getLocation()
	}

	func getCities(cityPrefix: String, completion: @escaping (CityData)-> Void) {
		networkService.getCities(cityPrefix: cityPrefix) { (cityData) in
			completion(cityData)
		}
	}

	func getWeather(lat: Double = 55.819091796875, long: Double = 37.49241786614363, completion: @escaping (WeatherData)-> Void) {
		networkService.getWeather(lat: lat, long: long) { (weatherData) in
			completion(weatherData)
//			print(weatherData)
		}
	}
}
