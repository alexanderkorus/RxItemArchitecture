//
//  BaseItemState.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import RxCocoa
import RxSwift

public protocol BaseItemState: State {

	var items: BehaviorRelay<[ItemGroup]> { get set }
}

public struct BaseState: BaseItemState {

	public static var `default`: BaseState {
		BaseState(items: BehaviorRelay<[ItemGroup]>(value: []))
	}

	public var items: BehaviorRelay<[ItemGroup]>
}
#endif
