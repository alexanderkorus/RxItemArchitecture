//
//  BaseViewController.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import RxSwift
import RxCocoa
import UIKit

open class BaseViewController<ViewType: UIView>: UIViewController {

	// MARK: - Stored properties
	public let bag: DisposeBag = DisposeBag()

	// MARK: - Computed properties

	// MARK: - Life-Cycle
	open override func viewDidLoad() {
		super.viewDidLoad()

		bindData()
		bindViews()

		view.backgroundColor = .white
	}

	open override func loadView() {
		self.view = ViewType()
	}

	// MARK: - Instance methods
	open func bindData() {}

	open func bindViews() {}
}

public extension BaseViewController {
	// swiftlint:disable:next force_cast
	unowned var rootView: ViewType { self.view as! ViewType }
}
#endif
