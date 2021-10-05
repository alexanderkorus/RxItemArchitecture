//
//  PageCollectionViewItem.swift
//  RxItemArchitecture_Example
//
//  Created by Alexander Korus on 06.10.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import RxItemArchitecture

struct PageCollectionViewItem: BaseCollectionItem {

	var type: BaseCollectionCell.Type {
		PageCollectionViewCell.self
	}

	var text: String
	var textColor: UIColor
	var backgroundColor: UIColor
}


class PageCollectionViewCell: UICollectionViewCell, BaseCollectionCell {

	typealias T = PageCollectionViewItem

	static var identifier: String = "PageCollectionViewCell"

	// MARK: - Subviews
	let textLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		textLabel.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(textLabel)

		self.textLabel.snp.remakeConstraints {
			$0.center.equalToSuperview()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func layout(item: Any) {

		guard let item = item as? T else { return }

		self.textLabel.text = item.text
		self.textLabel.textColor = item.textColor
		self.backgroundColor = item.backgroundColor
	}
}
