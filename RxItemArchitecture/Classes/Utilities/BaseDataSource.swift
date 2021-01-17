//
//  BaseDataSource.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//

import Foundation
import RxDataSources

open class BaseDataSource: RxTableViewSectionedReloadDataSource<ItemGroup> {

	public lazy var cellConfiguration: ConfigureCell = { (_, tableView, indexPath, item) -> BaseCell in

		let cell = tableView.dequeueReusableCell(item: item, indexPath: indexPath)
		cell.layout(item: item.item)

		return cell
	}

	public init() {

		super.init(configureCell: { _, _, _, _  -> UITableViewCell in return EmptyBaseCell() })
		configureCell = cellConfiguration
	}
}
