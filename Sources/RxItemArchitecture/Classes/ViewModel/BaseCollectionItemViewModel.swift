//
//  BaseCollectionItemViewModel.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation
import UIKit
import RxSwift

open class BaseCollectionItemViewModel<S: BaseCollectionItemState>: ViewModel<S> {

	public let bag: DisposeBag = DisposeBag()

	/// Takes an array of BaseItems, maps it to DataSourceItems and update the items state
	public var items: [BaseCollectionItem] = [] {
		didSet {
			let sourceItems = items.map { BaseCollectionSourceItem(item: $0) }
			self.state.items.accept([CollectionItemGroup(name: "", items: sourceItems)])
		}
	}

	open func buildCells(parentVC: UIViewController? = nil) {}
}
#endif
