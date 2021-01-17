//
//  BaseItemViewController.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//

import Foundation
import UIKit
import RxDataSources
import RxCocoa
import RxSwift

open class BaseItemViewController<ViewModel: BaseItemViewModel<State>, State: BaseItemState>: BaseViewController<BaseItemView> {

	// MARK: - Stored properties
	private let dataSource: RxTableViewSectionedReloadDataSource<ItemGroup>
	let viewModel: ViewModel
	let configuration: ((UIViewController) -> Void)?

	// MARK: - Initializer
	public init(
		dataSource: RxTableViewSectionedReloadDataSource<ItemGroup> = BaseDataSource(),
		viewModel: ViewModel,
		backgroundImage: UIImage? = nil,
		configuration: ((UIViewController) -> Void)? = ItemManager.default.viewControllerConfig
	) {
		self.dataSource = dataSource
		self.viewModel = viewModel
		self.configuration = configuration
		super.init(nibName: nil, bundle: nil)

		self.rootView.backgroundImageView.image = backgroundImage
	}

	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Life-Cycle
	open override func viewDidLoad() {
		super.viewDidLoad()

		configuration?(self)

		self.tableView.separatorStyle = .none
		self.tableView.registerBaseItems()

		viewModel.buildLayout()
	}

	// MARK: - Instance methods
	open override func bindViews() {

		viewModel.state.items.asObservable()
			.bind(to: tableView.rx.items(dataSource: dataSource))
			.disposed(by: bag)
	}
}

extension BaseItemViewController {
	unowned var tableView: UITableView { self.rootView.tableView }
}