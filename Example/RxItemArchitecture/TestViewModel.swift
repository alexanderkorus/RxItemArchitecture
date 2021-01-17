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

	static var `default`: TestState {
		TestState(items: BehaviorRelay<[ItemGroup]>(value: []))
	}
}

class TestViewModel: BaseItemViewModel<TestState> {

	override func buildLayout() {
		super.buildLayout()

		self.items = [
			TextItem(text: "Example"),
			TextItem(text: "Example2", textColor: .blue, alignment: .right),
		]
	}
}
