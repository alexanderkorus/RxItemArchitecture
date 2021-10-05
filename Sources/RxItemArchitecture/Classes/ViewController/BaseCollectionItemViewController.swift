//
//  BaseCollectionItemViewController.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

open class BaseCollectionItemViewController<
	ViewModel: BaseCollectionItemViewModel<State>,
	State: BaseCollectionItemState,
	View: BaseCollectionView
>: BaseViewController<View> {

	// MARK: - Stored properties
	public let dataSource: RxCollectionViewSectionedReloadDataSource<CollectionItemGroup>
	public let viewModel: ViewModel
	open var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)

	public init(
		dataSource: RxCollectionViewSectionedReloadDataSource<CollectionItemGroup> = BaseCollectionDataSource(),
		viewModel: ViewModel
	) {
		self.dataSource = dataSource
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	open override func viewDidLoad() {
		super.viewDidLoad()

		viewModel.buildCells(parentVC: self)
	}

	open override func bindData() {

		viewModel.state.items
			.bind(to: collectionView.rx.items(dataSource: dataSource))
			.disposed(by: bag)
	}
}

public extension BaseCollectionItemViewController {
	unowned var collectionView: UICollectionView { self.rootView.collectionView }
}


#endif
