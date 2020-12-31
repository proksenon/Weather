//
//  TreatmentTransactionPresenter.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation
final class MainPresenter {

	weak var view: MainViewInput?
	var interactor: MainInteractorInput?
	var router: MainRouterInput?
	var citiesCollectionViewDataSource: CitiesCollectionViewDataSource?
	var citiesCollectionViewDelegate: CitiesCollectionViewDelegate?
	var headerWeather: HeaderWeather?
	var hours: [Hour]?

	init(view: MainViewInput) {
		self.view = view
	}

	private func getCurrentWeather() {
		guard let coordinates = interactor?.getLocation(), let lat = coordinates.lat, let long = coordinates.long else { return }
		interactor?.getWeather(lat: lat, long: long) { (weatherData) in
			self.headerWeather = weatherData.headerWether
			self.hours = weatherData.forecasts?.first?.hours
//			print(weatherData.headerWether)
			DispatchQueue.main.async {
				self.updateWeatherCollection()
				self.updateCitiesCollection()
			}
//			updateCitiesCollection()
			//update table/collection
		}
	}

	private func updateCitiesCollection() {
		view?.updateCitiesCollectionView()
	}
	private func updateWeatherCollection() {
		view?.updateWeatherCollectionView()
	}

}

extension MainPresenter: MainViewOutput {

	func configureView() {
		getCurrentWeather()
	}
}

extension MainPresenter: MainInteractorOutput {

}

extension MainPresenter: MainModuleInput {

}

// MARK: -CitiesCollection
extension MainPresenter: CitiesCollectionViewDataSourceOutput {

}

extension MainPresenter: CitiesCollectionViewDelegateOutput {
	
}

// MARK: -WeatherCollection
extension MainPresenter: WeatherCollectionViewDataSourceOutput {
	func sectionItem(with indexPath: IndexPath)-> CollectionSectionItemProtocol {
		return headerWeather ?? HeaderWeather()
	}

}

extension MainPresenter: WeatherCollectionViewDelegateOutput {

}

// MARK: -HoursCollectionView

extension MainPresenter: HoursCollectionViewDataSourceOutput {
	func hour(with indexPath: IndexPath)->Hour? {
		guard let hours = hours else {return nil}
		return hours[indexPath.row]
	}

	func countOfRows() -> Int {
		return hours?.count ?? 0
	}

}

extension MainPresenter: HoursCollectionViewDelegateOutput {

}
