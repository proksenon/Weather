//
//  File.swift
//  TestCollection
//
//  Created by 18579132 on 16.12.2020.
//

import UIKit

class WeatherCollectionFlowLayout: UICollectionViewFlowLayout {
	override init() {
		super.init()
		scrollDirection = .vertical
		minimumLineSpacing = 10
//		estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//		estimatedItemSize.width = UIScreen.main.bounds.width
//		sectionHeadersPinToVisibleBounds = true
	}

//	override var collectionViewContentSize: CGSize {
//		get {
//			CGSize(width: 0, height: 1000)
//		}
//	}
//	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//
//			let layoutAttributes = super.layoutAttributesForElements(in: rect)
//
//			guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
//				return layoutAttributes
//			}
//		print(offset.y)
//			if offset.y < 0 {
//
//
//				for attributes in stLayoutAttributes {
//
//					if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
//
//						let diffValue = abs(offset.y)
//						var frame = attributes.frame
//						frame.size.height = max(0, headerReferenceSize.height + diffValue)
//						frame.origin.y = frame.minY - diffValue
//						attributes.frame = frame
//					}
//				}
//			}
//			return layoutAttributes
//		}

	var attributes: [UICollectionViewLayoutAttributes] = []

	override func prepare() {
		super.prepare()
		attributes = [] // Start with a fresh array of attributes
		guard let collectionView = collectionView else { return }

		// Add all item in sections into attributes
		let numberOfSections = collectionView.numberOfSections
		for section in 0..<numberOfSections {
			let headerIndexPath = IndexPath(item: 0, section: section)
			if let headerAttribute = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: headerIndexPath)?.copy() {
				attributes.append(headerAttribute as! UICollectionViewLayoutAttributes)
			}
			let numberOfItems = collectionView.numberOfItems(inSection: section)
			for item in 0..<numberOfItems {
				let indexPath = IndexPath(item: item, section: section)
				if let attribute = layoutAttributesForItem(at: indexPath)?.copy() {
//					print((attribute as! UICollectionViewLayoutAttributes).frame)
					(attribute as! UICollectionViewLayoutAttributes).frame.origin.y = (attribute as! UICollectionViewLayoutAttributes).frame.origin.y + 150
					attributes.append(attribute as! UICollectionViewLayoutAttributes)
				}
			}
		}
	}

	// Telling our UICollectionViewLayout that it should be updating the layout while scrolling
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}

	// We’ll use this constantly updating method to configure header and cell behaviours
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

		// Scroll offset
		let offset = collectionView?.contentOffset ?? CGPoint.zero

		// get all headers
		let headers = attributes.filter { attribute -> Bool in
			return attribute.representedElementKind == UICollectionView.elementKindSectionHeader
		}
		guard let topHeader = headers.first, let secondHeader = headers.last else { return nil }

		// Setup top header
		let topHeaderDefaultSize = topHeader.frame.size
//		print("layout offset =\(offset)")
		topHeader.frame.size.height = max(HeaderConstants.HeaderWeather.heightMin, topHeaderDefaultSize.height - offset.y)
		topHeader.frame.origin.y = offset.y

		// setup second header
		secondHeader.frame.origin.y = topHeader.frame.origin.y + topHeader.frame.size.height

		// Get all cells attributes
		let cells = attributes.filter { (attribute) -> Bool in
			return (attribute.representedElementKind != UICollectionView.elementKindSectionHeader) &&  (attribute.representedElementKind != UICollectionView.elementKindSectionFooter)
		}

		// limit the origin of all cells when scrolling
		let limit = secondHeader.frame.origin.y + secondHeader.frame.size.height
//		let limit = topHeader.frame.origin.y + topHeader.frame.size.height + secondHeader.frame.size.height
		for oneCell in cells {
//			print(oneCell)
//			oneCell.frame.origin.y = limit//oneCell.frame.origin.y <= limit ? 0 : oneCell.frame.origin.y
			if oneCell.frame.origin.y <= limit {
				let height = oneCell.frame.size.height - (limit - oneCell.frame.origin.y)
				oneCell.frame.size = CGSize(width: oneCell.frame.size.width, height: height > 0 ? height : 0)
				oneCell.frame.origin.y = height <= 0 ? oneCell.frame.origin.y : limit
			}
		}
//		cells.first?.frame.origin.y = limit
		return attributes
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
