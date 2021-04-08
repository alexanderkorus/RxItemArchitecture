//
//  SeperatorItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 08.04.21.
//
#if canImport(UIKit)
import Foundation
import UIKit

public struct SeperatorItem: BaseItem {

	public var type: BaseCell.Type {
		SeperatorCell.self
	}

	public var backgroundColor: UIColor = .lightGray
	public var insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
	public var height: CGFloat = 8.0
}

public class SeperatorCell: UITableViewCell, BaseCell {

	// MARK: - Outlets
	let seperator = UIView()
	var color: UIColor = .lightGray
	var height: CGFloat = 10.0
	var edges: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

	public static var identifier: String = "SeperatorCell"

	public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .none

		seperator.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(seperator)

	}

	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Helpers
	public func layout(item: Any) {

		guard let item = item as? SeperatorItem else { return }
		configure(item: item)
	}

	private func configure(item: SeperatorItem) {

		color = item.backgroundColor
		height = item.height
		edges = item.insets

		seperator.backgroundColor = item.backgroundColor

		seperator.snp.remakeConstraints { (make) in

			make.leading.equalToSuperview().offset(item.insets.left)
			make.trailing.equalToSuperview().offset(-item.insets.right)
			make.top.equalTo(item.insets.top)
			make.bottom.equalTo(item.insets.bottom)
			make.height.equalTo(item.height)
		}
	}
}
#endif
