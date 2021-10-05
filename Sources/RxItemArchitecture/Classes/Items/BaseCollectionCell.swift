//
//  BaseCollectionCell.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation
import UIKit

public protocol BaseCollectionCell: UICollectionViewCell {

	static var identifier: String { get set }

	func layout(item: Any)
}


public class EmptyBaseCollectionCell: UICollectionViewCell, BaseCollectionCell {

	public static var identifier: String = "EmptyBaseCollectionCell"

	public func layout(item: Any) {

	}
}
#endif
