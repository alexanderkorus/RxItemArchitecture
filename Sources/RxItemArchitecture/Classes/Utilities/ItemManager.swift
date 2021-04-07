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
		SegmentedControlCell.self
	]

	public var itemTypes: [BaseCell.Type] {
		_itemTypes
	}

	public func addTypes(_ types: [BaseCell.Type]) {
		self._itemTypes.append(contentsOf: types)
	}

	public var viewControllerConfig: ((UIViewController) -> Void)? = nil
}
#endif
