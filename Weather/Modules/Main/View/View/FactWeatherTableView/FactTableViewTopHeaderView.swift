//
//  FactTableViewTopHeaderView.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class FactTVTopHeaderView: UIView {

	let nameCityLabel = UILabel()
	let tempLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .green
		setupNameCityLabel()
		setupTempLabel()
	}

	private func setupNameCityLabel() {
		addSubview(nameCityLabel)
		nameCityLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([nameCityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
									 nameCityLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
		nameCityLabel.text = "Moscow"
		nameCityLabel.textColor = .yellow
	}

	private func setupTempLabel() {
		addSubview(tempLabel)
		tempLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([tempLabel.topAnchor.constraint(equalTo: nameCityLabel.bottomAnchor, constant: 10),
									 tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])

		tempLabel.text = "-5 grad"
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
