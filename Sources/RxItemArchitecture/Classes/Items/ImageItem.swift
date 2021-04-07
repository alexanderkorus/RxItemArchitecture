//
//  ImageItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import UIKit

public struct ImageItem: BaseItem {

	public var type: BaseCell.Type {
		ImageCell.self
	}

	public var image: UIImage?
	public var contentMode: UIView.ContentMode = .scaleAspectFit
	public var clipsToBounds: Bool = true
	public var sideSpaces: CGFloat = 20.0
	public var height: CGFloat = 100.0

	public init(image: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFit, clipsToBounds: Bool = true, sideSpaces: CGFloat = 20.0, height: CGFloat = 100.0) {
		self.image = image
		self.contentMode = contentMode
		self.clipsToBounds = clipsToBounds
		self.sideSpaces = sideSpaces
		self.height = height
	}
}

open class ImageCell: UITableViewCell, BaseCell {

	typealias T = ImageItem

	public static var identifier: String = "ImageCell"

	// MARK: - Subviews
	let localImageView: UIImageView = UIImageView()

	// MARK: - Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .clear
		selectionStyle = .none

		self.localImageView.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(localImageView)
	}

	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - Instance methods
	public func layout(item: Any) {
		guard let item = item as? T else { return }

		self.localImageView.clipsToBounds = item.clipsToBounds
		self.localImageView.contentMode = item.contentMode
		self.localImageView.image = item.image

		self.localImageView.snp.remakeConstraints {
			$0.top.equalToSuperview().offset(10.0)
			$0.leading.equalToSuperview().offset(item.sideSpaces)
			$0.trailing.equalToSuperview().offset(-item.sideSpaces)
			$0.bottom.equalToSuperview().offset(-10.0)
			$0.height.equalTo(item.height)
		}
	}
}
#endif
