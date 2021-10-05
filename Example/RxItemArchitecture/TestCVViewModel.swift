//
//  TestCVViewModel.swift
//  RxItemArchitecture_Example
//
//  Created by Alexander Korus on 06.10.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import RxItemArchitecture
import RxCocoa

struct TestCVState: BaseCollectionItemState {

	static var `default`: TestCVState {
		TestCVState(
			items: BehaviorRelay<[CollectionItemGroup]>(value: [])
		)
	}

	var items: BehaviorRelay<[CollectionItemGroup]>
}

class TestCVViewModel: BaseCollectionItemViewModel<TestCVState> {

	override func buildCells(parentVC: UIViewController? = nil) {

		guard let parentVC = parentVC else {
			return
		}

		self.items = [
			PageCollectionViewItem(
				text: "TestPage 1",
				textColor: .white,
				backgroundColor: .gray
			),
			PageCollectionViewItem(
				text: "TestPage 2",
				textColor: .white,
				backgroundColor: .brown
			),
			ViewControllerCollectionItem(
				viewController: BaseItemViewController(viewModel: Test2ViewModel(initialState: .default)),
				parentVC: parentVC
			)
		]
	}
}
