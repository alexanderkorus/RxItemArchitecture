//
//  TextItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import RxSwift
import UIKit

public struct TextItem: BaseItem {

	public var type: BaseCell.Type {
		TextCell.self
	}

	public var text: String
	public var font: UIFont = UIFont.systemFont(ofSize: 14.0)
	public var fontSize: CGFloat = 14.0
	public var textColor: UIColor = .black
	public var alignment: NSTextAlignment = .center

	public init(text: String, font: UIFont = UIFont.systemFont(ofSize: 14.0), fontSize: CGFloat = 14.0, textColor: UIColor = .black, alignment: NSTextAlignment = .center) {
		self.text = text
		self.font = font
		self.fontSize = fontSize
		self.textColor = textColor
		self.alignment = alignment
	}
}

open class TextCell: UITableViewCell, BaseCell {

	typealias T = TextItem

	public static var identifier: String = "TextCell"

	// MARK: - Subviews
	let txtLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()

	// MARK: - Initializer
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .clear
		selectionStyle = .none

		self.txtLabel.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(txtLabel)

		setupConstraints()
	}

	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Instance methods
	public func layout(item: Any) {
		guard let item = item as? T else { return }

		txtLabel.text = item.text
		txtLabel.font = item.font.withSize(item.fontSize)
		txtLabel.textColor = item.textColor
		txtLabel.textAlignment = item.alignment

		setupConstraints()
		self.layoutIfNeeded()
	}

	func setupConstraints() {

		self.txtLabel.snp.remakeConstraints {
			$0.top.equalToSuperview().offset(10.0)
			$0.leading.equalToSuperview().offset(20.0)
			$0.trailing.equalToSuperview().offset(-20.0)
			$0.bottom.equalToSuperview().offset(-10.0)
		}
	}
}
#endif
