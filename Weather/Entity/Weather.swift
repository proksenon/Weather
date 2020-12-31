//
//  Weather.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
	let now: Double?
	let info: Info?
	let fact: Fact?
	let forecasts: [Forecast]?
	var headerWether: HeaderWeather {
		get {
			HeaderWeather(temp: fact?.temp,
						  temp_min: forecasts?.first?.parts?.day?.temp_min,
						  temp_max: forecasts?.first?.parts?.day?.temp_max,
						  cityName: info?.tzinfo?.cityName,
						  condition: fact?.condition)
		}
	}
}

struct Info: Codable {
	let tzinfo: Tzinfo?
}

struct Tzinfo: Codable {
	let name: String?
	var cityName: String? {
		get {
			guard let _name = name else { return nil }
			return String(_name[(_name.firstIndex(of: "/") ?? _name.startIndex)...])
		}
	}
}

struct Fact: Codable {
	let temp: Double?
	let feels_like: Double?
	let icon: String?
	let condition: String?
	let wind_speed: Double?
	let pressure_mm: Int?
	let pressure_pa: Int?
}


struct Forecast: Codable {
	let date: String?
	let sunrise: String?
	let sunset: String?
	let parts: Part?
	let hours: [Hour]?
}

struct Part: Codable {
	let night: PartWeather?
	let day: PartWeather?
}

struct PartWeather: Codable {
	let temp_avg: Double?
	let temp_min: Double?
	let temp_max: Double?
	let icon: String?
	let condition: String?
	let prec_strength: Double?
	let cloudness: Double?
}

struct Hour: Codable {
	let hour: String?
	let temp: Double?
	let icon: String
}


struct HeaderWeather: CollectionSectionItemProtocol {
	var identifier: String = Cells.Id.header.rawValue
	var temp: Double?
	var temp_min: Double?
	var temp_max: Double?
	var cityName: String?
	var condition: String?
}
