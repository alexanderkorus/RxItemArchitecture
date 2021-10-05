//
//  Test2ViewModel.swift
//  RxItemArchitecture_Example
//
//  Created by Alexander Korus on 06.10.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import RxItemArchitecture
import RxCocoa

struct Test2State: BaseItemState {

	var items: BehaviorRelay<[ItemGroup]>

	static var `default`: Test2State {
		Test2State(
			items: BehaviorRelay<[ItemGroup]>(value: [])
		)
	}
}

class Test2ViewModel: BaseItemViewModel<Test2State> {

	override func buildLayout() {
		super.buildLayout()

		self.items = [
			TextItem(text: "This is so easy and insane like SwiftUI!"),
		]
	}
}
