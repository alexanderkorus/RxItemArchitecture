//
//  ItemGroup.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import RxDataSources

public struct ItemGroup {

	let name: String
	public var items: [Item]

	init(name: String, items: [Item]) {

		self.name = name
		self.items = items
	}
}

extension ItemGroup: SectionModelType {

	public typealias Item = BaseSourceItem

	public init(original: ItemGroup, items: [BaseSourceItem]) {

		self = original
		self.items = items
	}
}

public struct BaseSourceItem {

	public var item: BaseItem
}
#endif
