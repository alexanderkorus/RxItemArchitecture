//
//  ViewControllerCollectionItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation
import UIKit

public struct ViewControllerCollectionItem: BaseCollectionItem {

	public var type: BaseCollectionCell.Type {
		ViewControllerCollectionViewCell.self
	}

	public let viewController: UIViewController
	public let parentVC: UIViewController

	public init(viewController: UIViewController, parentVC: UIViewController) {
		self.viewController = viewController
		self.parentVC = parentVC
	}
}

class ViewControllerCollectionViewCell: UICollectionViewCell, BaseCollectionCell {

	static var identifier: String = "ViewControllerCollectionViewCell"

	typealias T = ViewControllerCollectionItem

	// MARK: - Stored properties
	var view: UIView? {
		didSet {
			guard let view = view else { return }
			self.contentView.addSubview(view)
			view.translatesAutoresizingMaskIntoConstraints = false
			//view.clipsToBounds = true
			view.snp.remakeConstraints {
				$0.top.leading.trailing.bottom.equalTo(self.contentView)
			}
			self.layoutIfNeeded()
		}
	}

	// MARK: - Life-Cycle
	override func prepareForReuse() {
		super.prepareForReuse()

		//Make sure that hostedView hasn't been added as a subview to a different cell
		if view?.superview == contentView {
			view?.removeFromSuperview()
		}

		view = nil
	}

	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)

		self.backgroundColor = .white
	}

	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Instance methods
	func layout(item: Any) {
		guard let item = item as? T else { return }
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
