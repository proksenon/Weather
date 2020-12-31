//
//  TreatmentTransactionConfigurator.swift
//  MoneyTransfer
//
//  Created by 18579132 on 10.09.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class MainConfigurator: MainConfiguratorProtocol {

	func configure(with viewController: MainViewController) {
		let presenter = MainPresenter(view: viewController)
		let interactor = MainInteractor(presenter: presenter)
		let router = MainRouter(viewController: viewController)
		let citiesCollectionViewDelegate = CitiesCollectionViewDelegate(output: presenter)
		let citiesCollectionViewDataSource = CitiesCollectionViewDataSource(output: presenter)

		viewController.output = presenter
		presenter.interactor = interactor
		presenter.router = router
		presenter.citiesCollectionViewDelegate = citiesCollectionViewDelegate
		presenter.citiesCollectionViewDataSource = citiesCollectionViewDataSource
		viewController.mainView.citiesCollectionView.delegate = citiesCollectionViewDelegate
		viewController.mainView.citiesCollectionView.dataSource = citiesCollectionViewDataSource
		
	}

}
