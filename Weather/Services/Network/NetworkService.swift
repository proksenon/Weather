//
//  NetworkService.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
import CoreLocation

final class NetworkService: NetworkServiceProtocol {

	private let cityHeaders = [
		"x-rapidapi-key": "2b6c72efcemshe878dd5e7cc1e10p1f64e1jsn045d8322b201",
		"x-rapidapi-host": "wft-geo-db.p.rapidapi.com"
	]
	private let weatherHeaders = ["X-Yandex-API-Key": "f7207de5-463a-4d52-baab-4c04b9190a8a"]
	private var session: URLSession
	private var dispatchQueue: DispatchQueue

	init(session: URLSession = URLSession.shared, dispatchQueue: DispatchQueue = DispatchQueue.main) {
		self.session = session
		self.dispatchQueue = dispatchQueue
	}

	private func getData(url: URL, headers: [String: String], completion: @escaping (Data)->Void) {

		let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = headers

		session.dataTask(with: request as URLRequest, completionHandler: { [weak self] (data, response, error) -> Void in
			guard  error == nil else { print(error ?? "session dataTask error"); return }
			let httpResponse = response as? HTTPURLResponse
			print("response")
			print(httpResponse)
			guard let data = data else { return }
			self?.dispatchQueue.async {
				completion(data)
			}
		}).resume()
	}

	func getCities(cityPrefix: String, completion: @escaping (CityData)-> Void) {
		guard let url = URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/cities?namePrefix=\(cityPrefix)") else { return }
		getData(url: url, headers: cityHeaders) { (data) in
			do {
				let cities = try JSONDecoder().decode(CityData.self, from: data)
				completion(cities)
			} catch {
				print("decode error")
				print(error)
			}
		}
	}
//	55.819091796875
//	37.49241786614363
	func getWeather(lat: Double = 55.819091796875, long: Double = 37.49241786614363, completion: @escaping (WeatherData)-> Void) {
		guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(long)&extra=true") else {print("gg"); return }
		getData(url: url, headers: weatherHeaders) { (data) in
			print(data)
			do {
				let weather = try JSONDecoder().decode(WeatherData.self, from: data)
				completion(weather)
//				print("\n\n\n weather data \n\n\n")
//				print(weather)
			} catch {
				print("decode error")
				print(error)
			}
		}

	}

//	func getCurrentLocation() {
//		var locManager = CLLocationManager()
//		var currentLocation: CLLocation!
//		locManager.requestWhenInUseAuthorization()
//		if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
//					CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
//					currentLocation = locManager.location
//					print(currentLocation.coordinate.latitude)
//					print(currentLocation.coordinate.longitude)
//				}
//	}

}
