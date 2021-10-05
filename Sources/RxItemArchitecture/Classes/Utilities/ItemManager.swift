//
//  ItemManager.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import UIKit

public class ItemManager {

	public static let `default`: ItemManager = {
		ItemManager()
	}()

	private init() {}

	private var _itemTypes: [BaseCell.Type] = [
		EmptyBaseCell.self,
		TextCell.self,
		ImageCell.self,
		ViewControllerCell.self,
		SegmentedControlCell.self,
		SeperatorCell.self,
		ButtonCell.self
	]

	private var _collectionItemTypes: [BaseCollectionCell.Type] = [
		ViewControllerCollectionViewCell.self
	]

	public var itemTypes: [BaseCell.Type] {
		_itemTypes
	}

	public var collectionItemTypes: [BaseCollectionCell.Type] {
		_collectionItemTypes
	}

	public func addTypes(_ types: [BaseCell.Type]) {
		self._itemTypes.append(contentsOf: types)
	}

	public func addCollectionTypes(_ types: [BaseCollectionCell.Type]) {
		self._collectionItemTypes.append(contentsOf: types)
	}

	public var viewControllerConfig: ((UIViewController) -> Void)? = nil
}
#endif
