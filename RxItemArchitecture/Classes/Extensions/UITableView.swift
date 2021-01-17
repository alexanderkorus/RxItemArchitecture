//
//  UITableView.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//

import UIKit

extension UITableView {

	func dequeueReusableCell(item: BaseSourceItem, indexPath: IndexPath) -> BaseCell {

		guard let cell = dequeueReusableCell(withIdentifier: item.item.type.identifier, for: indexPath) as? BaseCell else {
			return EmptyBaseCell()
		}
		return cell
	}

	func registerBaseItems() {
		registerBaseItems(ItemManager.default.itemTypes)
	}

	func registerBaseItems(_ items: [BaseCell.Type]) {
		for type in items {
			register(type, forCellReuseIdentifier: type.identifier)
		}
	}

}
