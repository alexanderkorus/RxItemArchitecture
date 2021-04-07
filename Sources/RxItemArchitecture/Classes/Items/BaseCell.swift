//
//  BaseCell.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import UIKit

public protocol BaseCell: UITableViewCell {

	static var identifier: String { get set }

	func layout(item: Any)
}


public class EmptyBaseCell: UITableViewCell, BaseCell {

	public static var identifier: String = "EmptyBaseCell"

	public func layout(item: Any) {

	}
}
#endif
