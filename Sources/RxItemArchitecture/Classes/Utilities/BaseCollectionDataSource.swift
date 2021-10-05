//
//  BaseCollectionDataSource.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 06.10.21.
//

#if canImport(UIKit)

import Foundation
import RxDataSources
import UIKit

open class BaseCollectionDataSource: RxCollectionViewSectionedReloadDataSource<CollectionItemGroup> {

	public lazy var cellConfiguration: ConfigureCell = { (_, tableView, indexPath, item) -> BaseCollectionCell in

		let cell = tableView.dequeueReusableCell(item: item, indexPath: indexPath)
		cell.layout(item: item.item)

		return cell
	}

	public init() {

		super.init(
			configureCell: { _, _, _, _  -> UICollectionViewCell in
				return EmptyBaseCollectionCell()
			}
		)
		configureCell = cellConfiguration
	}
}
#endif
