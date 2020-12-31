//
//  WeatherCollectionViewCell.swift
//  TestCollection
//
//  Created by 18579132 on 16.12.2020.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
//	let label = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 20))
	let label = UILabel()
	let label2 = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear
		clipsToBounds = true
//		addSubview(imageView)
//		imageView.backgroundColor = .blue
//		imageView.translatesAutoresizingMaskIntoConstraints = false
//		NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//									 imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//									 imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//									 imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])

		addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
//		let topConstant = label.topAnchor.constraint(equalTo: topAnchor, constant: 10)
//		topConstant.priority = .defaultLow
//		topConstant.isActive = true
		NSLayoutConstraint.activate([
//									label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//									 label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
									 label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
									label.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])

		label.text = "gg"
		label.textColor = .white


		addSubview(label2)
		label2.translatesAutoresizingMaskIntoConstraints = false
//		let topConstant = label2.topAnchor.constraint(equalTo: topAnchor, constant: 10)
//		topConstant.priority = .defaultLow
//		topConstant.isActive = true
		NSLayoutConstraint.activate([
										label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
										label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
										label2.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
										label2.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])

		label2.text = "gg"
		label2.textColor = .white


	}
	override func layoutSubviews() {
		super.layoutSubviews()
		// 100 - высота ячейки
		// 10
//		label.frame.origin.y = 10 - (100 - frame.height)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


}
