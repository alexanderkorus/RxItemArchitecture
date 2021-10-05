//
//  BaseCollectionItemState.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 05.10.21.
//

#if canImport(UIKit)
import Foundation
import RxCocoa
import RxSwift

public protocol BaseCollectionItemState: State {

	var items: BehaviorRelay<[CollectionItemGroup]> { get set }
}

public struct BaseCollectionState: BaseCollectionItemState {

	public static var `default`: BaseCollectionState {
		BaseCollectionState(items: BehaviorRelay<[CollectionItemGroup]>(value: []))
	}

	public var items: BehaviorRelay<[CollectionItemGroup]>
}
#endif
