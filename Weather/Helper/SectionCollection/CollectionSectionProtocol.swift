//
//  CollectionSectionProtocol.swift
//  Weather
//
//  Created by 18579132 on 29.12.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

/// Протокол ячейки
protocol CollectionSectionProtocol: UICollectionReusableView {
	/// Конфигурирует ячейку
	/// - Parameter item: Модель данных для конфигурации ячейки
	func configureCell(with item: CollectionSectionItemProtocol)
}
