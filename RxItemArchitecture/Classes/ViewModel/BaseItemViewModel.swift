//
//  BaseItemViewModel.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//

import Foundation
import UIKit
import RxSwift

open class BaseItemViewModel<S: BaseItemState>: ViewModel<S> {

	public let bag: DisposeBag = DisposeBag()

	/// Takes an array of BaseItems, maps it to DataSourceItems and update the items state
	public var items: [BaseItem] = [] {
		didSet {
			let sourceItems = items.map { BaseSourceItem(item: $0) }
			self.state.items.accept([ItemGroup(name: "", items: sourceItems)])
		}
	}

	open func buildLayout() {}

	open func onCellTapped(by indexPath: IndexPath, in tableView: UITableView, in viewController: UIViewController) {}
}
