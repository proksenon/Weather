//
//  MainView.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class MainView: UIView {

	let pageControl = UIPageControl()
	let selectCityButton = UIButton()
	let bottomView = UIView()
	let citiesCollectionView = CitiesCollectionView()
	let fonImageView = UIImageView()



	override init(frame: CGRect) {
		super.init(frame: frame)
		setupFonImageView()
		setupBottomView()
		backgroundColor = .clear//UIColor.blue//.withAlphaComponent(0.7)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupBottomView() {
		addSubview(bottomView)
		bottomView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
									 bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
									 bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
									 bottomView.heightAnchor.constraint(equalToConstant: 50)])
		setupSelectCityButton()
		setupPageControl()
		setupCitiesCollectionView()
		bottomView.backgroundColor = .gray
	}

	private func setupSelectCityButton() {
		bottomView.addSubview(selectCityButton)
		selectCityButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([selectCityButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
									 selectCityButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
									 selectCityButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -30)])
//									 selectCityButton.widthAnchor.constraint(equalToConstant: 30)])
		selectCityButton.setTitle("Table", for: .normal)
		selectCityButton.setTitleColor(.blue, for: .normal)
//		selectCityButton.setImage(UIImage(named: "book"), for: .normal)
	}

	private func setupPageControl() {
		bottomView.addSubview(pageControl)
		pageControl.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([pageControl.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
									 pageControl.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
									 pageControl.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -30)])
		pageControl.backgroundColor = UIColor.red
		pageControl.pageIndicatorTintColor = .green
		pageControl.numberOfPages = 4
	}

	private func setupCitiesCollectionView() {
		addSubview(citiesCollectionView)
		citiesCollectionView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([citiesCollectionView.topAnchor.constraint(equalTo: topAnchor),
									 citiesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
									 citiesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
									 citiesCollectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)])
	}

	private func setupFonImageView() {
		addSubview(fonImageView)
		fonImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([fonImageView.topAnchor.constraint(equalTo: topAnchor),
									 fonImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
									 fonImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
									 fonImageView.bottomAnchor.constraint(equalTo: bottomAnchor)])

		fonImageView.image = UIImage(named: "background")
	}

//	func cellWeatherCollectionViewUpdate() {
//		print(citiesCollectionView.visibleCells.count)
//	}

}
