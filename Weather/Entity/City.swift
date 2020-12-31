//
//  Cities.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
struct City: Codable {
	let type: String?
	let city: String?
	let country: String?
	let latitude: Double?
	let longitude: Double?
}

struct CityData: Codable {
	let data: [City]?
	let metadata: Metadata?
}

struct Metadata: Codable {
	let currentOffset: Int?
	let totalCount: Int?
}
