//
//  LocationService.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
import CoreLocation

final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
	private var locManager: CLLocationManager
//	{
//			let _locManager = CLLocationManager()
//			_locManager.requestWhenInUseAuthorization()
//			_locManager.delegate = self
//			return _locManager
//	}
	override init() {
		locManager = CLLocationManager()
		super.init()
		locManager.requestWhenInUseAuthorization()
		locManager.delegate = self
	}

	func getLocation()->(lat: Double?, long: Double?) {
		var currentLocation: CLLocation?

		if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
				CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
			guard let location = locManager.location else { return (nil, nil)}
			currentLocation = location
			print(currentLocation?.coordinate.latitude ?? 0)
			print(currentLocation?.coordinate.longitude ?? 0)
		}
		return (currentLocation?.coordinate.latitude, currentLocation?.coordinate.longitude)
	}
	
}
