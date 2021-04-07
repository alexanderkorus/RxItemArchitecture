//
//  ViewModel.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation

/// The base class for ViewModels with a generic state type. Should be used for business logic.
open class ViewModel<StateType: State> {

	// MARK: - Stored properties
	public let state: StateType

	// MARK: - Initializers
	public init(initialState: StateType) {

		self.state = initialState
	}
}
#endif
