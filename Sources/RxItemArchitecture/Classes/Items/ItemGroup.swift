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

	public let name: String
	public var items: [Item]

	public init(name: String, items: [Item]) {

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

	public init(item: BaseItem) {
		self.item = item
	}
}

public struct CollectionItemGroup {

	public let name: String
	public var items: [Item]

	public init(name: String, items: [Item]) {

		self.name = name
		self.items = items
	}
}

extension CollectionItemGroup: SectionModelType {

	public typealias Item = BaseCollectionSourceItem

	public init(original: CollectionItemGroup, items: [BaseCollectionSourceItem]) {

		self = original
		self.items = items
	}
}

public struct BaseCollectionSourceItem {

	public var item: BaseCollectionItem

	public init(item: BaseCollectionItem) {
		self.item = item
	}
}


#endif
