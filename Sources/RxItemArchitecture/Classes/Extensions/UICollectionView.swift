//
//  UICollectionView.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import UIKit

public extension UICollectionView {

	func dequeueReusableCell(item: BaseCollectionSourceItem, indexPath: IndexPath) -> BaseCollectionCell {

		guard let cell = dequeueReusableCell(withReuseIdentifier: item.item.type.identifier, for: indexPath) as? BaseCollectionCell
		else {
			return EmptyBaseCollectionCell()
		}
		return cell
	}

	func registerBaseItems() {
		registerBaseItems(ItemManager.default.collectionItemTypes)
	}

	func registerBaseItems(_ items: [BaseCollectionCell.Type]) {
		for type in items {
			register(type, forCellWithReuseIdentifier: type.identifier)
		}
	}

}
#endif
