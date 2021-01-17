//
//  State.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//

import Foundation

public protocol State: Copyable {

	/**
	The default State instance.
	*/
	static var `default`: Self { get }
}
