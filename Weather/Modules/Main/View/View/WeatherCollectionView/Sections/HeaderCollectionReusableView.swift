//
//  HeaderCollectionReusableView.swift
//  TestCollection
//
//  Created by 18579132 on 16.12.2020.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

	let cityLabel = UILabel()
	let conditionLabel = UILabel()
	let tempLabel = UILabel()
	let tempMinLabel = UILabel()
	let tempMaxLabel = UILabel()
	var topConstraint: NSLayoutConstraint?

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear//.blue//UIColor.darkGray.withAlphaComponent(0.5)
		clipsToBounds = true

		setupCityLabel()
		setupConditionLabel()
		setupTempLabel()
		setupTempMinLabel()
		setupTempMaxLabel()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		let diffTop = HeaderConstants.HeaderWeather.topMax - HeaderConstants.HeaderWeather.topMin
		let step = (HeaderConstants.HeaderWeather.heightMax - frame.height)/((HeaderConstants.HeaderWeather.heightMax - HeaderConstants.HeaderWeather.heightMin) / diffTop)
		let height = HeaderConstants.HeaderWeather.topMax - (step > diffTop ? diffTop: step)
		topConstraint?.constant = height > HeaderConstants.HeaderWeather.topMax ? HeaderConstants.HeaderWeather.topMax: height
	}

	private func setupCityLabel() {
		addSubview(cityLabel)
		cityLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 cityLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])
		topConstraint = cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120)
		topConstraint?.isActive = true
//		topConstraint?.constant
		cityLabel.textAlignment = .center
		cityLabel.text = "Moscow"
		cityLabel.textColor = .white
		cityLabel.font = UIFont(name: "Futura Medium", size: 25)

	}

	private func setupConditionLabel() {
		addSubview(conditionLabel)
		conditionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([conditionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 conditionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
									 conditionLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5)])

		conditionLabel.textAlignment = .center
		conditionLabel.text = "Облачно"
		conditionLabel.font = UIFont(name: "Futura Medium", size: 20)
		conditionLabel.textColor = .white

	}

	private func setupTempLabel() {
		addSubview(tempLabel)
		tempLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
									 tempLabel.topAnchor.constraint(equalTo: conditionLabel.bottomAnchor, constant: 5)])

		tempLabel.textAlignment = .center
		tempLabel.font = UIFont(name: "Futura Medium", size: 45)
		tempLabel.text = "27%"
		tempLabel.textColor = .white

	}

	private func setupTempMinLabel() {
		addSubview(tempMinLabel)
		tempMinLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([tempMinLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
									 tempMinLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -2),
									 tempMinLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5)])

		tempMinLabel.textAlignment = .right
		tempMinLabel.text = "10%"
		tempMinLabel.textColor = .white
	}

	private func setupTempMaxLabel() {
		addSubview(tempMaxLabel)
		tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([tempMaxLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 2),
									 tempMaxLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
									 tempMaxLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5)])

		tempMaxLabel.textAlignment = .left
		tempMaxLabel.text = "30%"
		tempMaxLabel.textColor = .white
	}





	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

extension HeaderCollectionReusableView: CollectionSectionProtocol {
	func configureCell(with item: CollectionSectionItemProtocol) {
		guard let headerWeather = item as? HeaderWeather else { return }
		cityLabel.text = headerWeather.cityName
		conditionLabel.text = headerWeather.condition
		tempLabel.text = String(headerWeather.temp ?? 0.0)
		tempMinLabel.text = String(headerWeather.temp_min ?? 0.0)
		tempMaxLabel.text = String(headerWeather.temp_max ?? 0.0)
	}


}
