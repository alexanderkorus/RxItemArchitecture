//
//  ViewControllerItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import UIKit

public struct ViewControllerItem: BaseItem {

	public init(viewController: UIViewController, parentVC: UIViewController) {
		self.viewController = viewController
		self.parentVC = parentVC
	}

	public var type: BaseCell.Type {
		ViewControllerCell.self
	}

	public let viewController: UIViewController
	public let parentVC: UIViewController
}

open class ViewControllerCell: UITableViewCell, BaseCell {

	public static var identifier: String = "ViewControllerCell"

	// MARK: - Stored properties
	var view: UIView? {
		didSet {
			guard let view = view else { return }
			view.translatesAutoresizingMaskIntoConstraints = false
			self.contentView.addSubview(view)
			//view.clipsToBounds = true
			view.snp.remakeConstraints {
				$0.top.leading.trailing.bottom.equalTo(self.contentView)
			}
			self.layoutIfNeeded()
		}
	}

	// MARK: - Life-Cycle
	open override func prepareForReuse() {
		super.prepareForReuse()

		//Make sure that hostedView hasn't been added as a subview to a different cell
		if view?.superview == contentView {
			view?.removeFromSuperview()
		}

		view = nil
	}

	// MARK: - Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = .white
	}

	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Instance methods
	public func layout(item: Any) {
		guard let item = item as? ViewControllerItem else { return }
		set(viewController: item.viewController, to: item.parentVC)
	}

	private func set(viewController: UIViewController, to parentVC: UIViewController) {

		parentVC.addChild(viewController)
		view = viewController.view
		viewController.didMove(toParent: parentVC)
		viewController.view.layoutIfNeeded()
		self.contentView.frame = self.bounds
		self.contentView.layoutIfNeeded()
	}
}
#endif
