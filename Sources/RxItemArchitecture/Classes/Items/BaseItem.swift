//
//  BaseItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation

public protocol BaseItem {
	var type: BaseCell.Type { get }
}
#endif
