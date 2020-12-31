//
//  SecondHeaderWithHoursCVCollectionReusableView.swift
//  TestCollection
//
//  Created by 18579132 on 17.12.2020.
//

import UIKit

class SecondHeaderWithHoursCVCollectionReusableView: UICollectionReusableView, CollectionSectionProtocol {


	let label = UILabel()
	let hoursCollectionView = HoursCollectionView()


	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear//UIColor.green.withAlphaComponent(0.5)
//		addSubview(label)
//		label.translatesAutoresizingMaskIntoConstraints = false
//		NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//									 label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//									 label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//									 label.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])
//
//		label.text = "secondGG"
		setupHorusCollectionView()
	}

	private func setupHorusCollectionView() {
		addSubview(hoursCollectionView)
		hoursCollectionView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([hoursCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
									 hoursCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
									 hoursCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
									 hoursCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configureCell(with item: CollectionSectionItemProtocol) {
		
	}
}
