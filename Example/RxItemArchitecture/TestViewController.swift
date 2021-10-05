//
//  ViewController.swift
//  RxItemArchitecture
//
//  Created by alexanderkorus-oskar on 01/15/2021.
//  Copyright (c) 2021 alexanderkorus-oskar. All rights reserved.
//

import UIKit
import RxItemArchitecture

class TestViewController: BaseItemViewController<TestViewModel, TestState> {

	override func bindData() {
		super.bindData()

		viewModel.state.action.asObservable()
			.bind { [weak self] action in
				switch action {
					case .showCollectionView:
						let testCVVC = TestCVViewController(
							viewModel: TestCVViewModel(initialState: .default)
						)
						self?.present(testCVVC, animated: true, completion: nil)
				}
			}
			.disposed(by: bag)

	}
}

