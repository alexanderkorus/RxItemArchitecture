//
//  TestViewModel.swift
//  RxItemArchitecture_Example
//
//  Created by Alexander Korus on 17.01.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import RxItemArchitecture
import RxCocoa

struct TestState: BaseItemState {

	var items: BehaviorRelay<[ItemGroup]>
	var action: PublishRelay<Action>

	static var `default`: TestState {
		TestState(
			items: BehaviorRelay<[ItemGroup]>(value: []),
			action: PublishRelay<Action>()
		)
	}

	enum Action {
		case showCollectionView
	}
}

class TestViewModel: BaseItemViewModel<TestState> {

	override func buildLayout() {
		super.buildLayout()

		self.items = [
			TextItem(text: "Example"),
			TextItem(text: "Example2", textColor: .blue, alignment: .right),
			ButtonItem(
				title: "CollectionView öffnen",
				styling: {
					$0.backgroundColor = .black
					$0.setTitleColor(.white, for: .normal)
				},
				onTap: { [weak self] in
					self?.state.action.accept(.showCollectionView)
				}
			)
		]
	}
}
