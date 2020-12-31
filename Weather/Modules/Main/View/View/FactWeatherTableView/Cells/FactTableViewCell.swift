//
//  FactTableViewCell.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {

	let headerLabel = UILabel()
	let informationLabel = UILabel()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		setupHeaderLabel()
		setupInformationLabel()
	}

	private func setupHeaderLabel() {
		addSubview(headerLabel)
		headerLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: Table.constraints.top),
									 headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Table.constraints.left)])
		headerLabel.text = "HeaderText"
		headerLabel.textColor = .gray
		headerLabel.font = headerLabel.font.withSize(10)
	}

	private func setupInformationLabel() {
		addSubview(informationLabel)
		informationLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([informationLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Table.constraints.top),
									 informationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Table.constraints.left),
									 informationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Table.constraints.bottom)])
		informationLabel.text = "Inform"
		informationLabel.textColor = .white
		informationLabel.font = informationLabel.font.withSize(15)

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
