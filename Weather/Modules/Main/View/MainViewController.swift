//
//  TreatmentViewController.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit
import CoreLocation

final class MainViewController: UIViewController {//, CLLocationManagerDelegate

	var output: MainViewOutput?
	let configurator: MainConfiguratorProtocol
	let mainView = MainView()
//	var locationManager: CLLocationManager?

	init(configurator: MainConfiguratorProtocol = MainConfigurator()) {
		self.configurator = configurator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func viewDidLoad() {
        super.viewDidLoad()
		configurator.configure(with: self)
		output?.configureView()

//		NetworkService().getCities(cityPrefix: "") { (cities) in
//			print(cities)
//		}
//		NetworkService().getCurrentLocation()
//		LocationService().getLocation()

//		NetworkService().getWeather()



//		locationManager = CLLocationManager()
//			locationManager?.delegate = self
//			locationManager?.requestAlwaysAuthorization()

    }
	override func loadView() {
		view = mainView
	}

//	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//		if status == .authorizedAlways {
//			if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
//				if CLLocationManager.isRangingAvailable() {
//					let currentLocation = manager.location
//				  print(currentLocation!.coordinate.latitude)
//				  print(currentLocation!.coordinate.longitude)
////					NetworkService().getWeather(lat: currentLocation!.coordinate.latitude, long: currentLocation!.coordinate.longitude)
//				}
//			}
//		}
//	}


}

extension MainViewController: MainViewInput {

	func updateCitiesCollectionView() {
//		print(mainView.citiesCollectionView.cellForItem(at: [0,0]))
//		print(mainView.citiesCollectionView.visibleCells)
//		(mainView.citiesCollectionView.cellForItem(at: [0,0]) as! CitiesCollectionViewCell).weatherCollectionView.reloadData()
		mainView.citiesCollectionView.reloadData()
//		print("visible = \(mainView.citiesCollectionView.visibleCells.count)")
//		print(mainView.citiesCollectionView.cellForItem(at: [0,0]))// as! CitiesCollectionViewCell).weatherCollectionView.reloadData()

	}
	func updateWeatherCollectionView() {
		guard let cell = mainView.citiesCollectionView.cellForItem(at: [0,0]) as? CitiesCollectionViewCell else { return }
		cell.weatherCollectionView.reloadData()
	}


	
}
