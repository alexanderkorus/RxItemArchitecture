//
//  BaseCollectionItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation

public protocol BaseCollectionItem {
	var type: BaseCollectionCell.Type { get }
}
#endif
