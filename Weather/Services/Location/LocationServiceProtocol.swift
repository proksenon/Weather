//
//  LocationServiceProtocol.swift
//  Weather
//
//  Created by 18579132 on 28.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

protocol LocationServiceProtocol {
	func getLocation()->(lat: Double?, long: Double?)
}
