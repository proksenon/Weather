//
//  CollectionViewCell.swift
//  Weather
//
//  Created by 18579132 on 14.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class HoursCollectionViewCell: UICollectionViewCell {

	let timeLabel = UILabel()
	let iconWeatherImageView = UIImageView()
	let tempLabel = UILabel()

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear

		setupTimeLabel()
		setupIconWeatherImageView()
		setupTempLabel()
	}

	private func setupTimeLabel() {
		addSubview(timeLabel)
		timeLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
									 timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])

		timeLabel.text = "14:00"
		timeLabel.textAlignment = .center

	}

	private func setupIconWeatherImageView() {
		addSubview(iconWeatherImageView)
		iconWeatherImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([iconWeatherImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
//									 iconWeatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//									 iconWeatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
									 iconWeatherImageView.widthAnchor.constraint(equalToConstant: 10),
									 iconWeatherImageView.heightAnchor.constraint(equalToConstant: 10),
									 iconWeatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor)])

		iconWeatherImageView.image = UIImage(named: "test")

	}

	private func setupTempLabel() {
		addSubview(tempLabel)
		tempLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([tempLabel.topAnchor.constraint(equalTo: iconWeatherImageView.bottomAnchor, constant: 10),
									 tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
									 tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])

		tempLabel.text = "-3%"
		tempLabel.textAlignment = .center

	}

	func configureCell(with hour: Hour) {
		timeLabel.text = hour.hour
		tempLabel.text = String(hour.temp ?? 0.0)
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
