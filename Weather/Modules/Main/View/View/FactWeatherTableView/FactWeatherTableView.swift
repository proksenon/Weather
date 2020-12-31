//
//  FactWeatherTableView.swift
//  Weather
//
//  Created by 18579132 on 15.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class FactWeatherTableView: UITableView {

	init() {
		super.init(frame: .zero, style: .plain)
		register(FactTableViewCell.self, forCellReuseIdentifier: Cells.Id.fact.rawValue)
//		register(CardTableViewCell.self, forCellReuseIdentifier: Cells.CellsID.cardCell.rawValue)
		tableFooterView = UIView()
		separatorStyle = .none
		backgroundColor = .clear//UIColor.blue.withAlphaComponent(0.4)
		estimatedRowHeight = 50
		contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
//		let vi = UIView()
//		vi.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//		vi.backgroundColor = .yellow
//		tableHeaderView = vi
		clipsToBounds = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


}
