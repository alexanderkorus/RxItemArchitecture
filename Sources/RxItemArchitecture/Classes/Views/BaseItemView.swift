//
//  BaseView.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import UIKit
import SnapKit

open class BaseItemView: UIView {

	// MARK: - Subviews
	public let backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = .clear
		return imageView
	}()

	public let tableView: UITableView = {
		let tableView = UITableView()
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableView.automaticDimension
		tableView.tableFooterView = UIView()
		tableView.backgroundColor = .clear
		return tableView
	}()

	// MARK: - Initializer
	public override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white

		self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.backgroundImageView)
		self.addSubview(self.tableView)

		self.backgroundImageView.snp.remakeConstraints {
			$0.top.leading.trailing.bottom.equalToSuperview()
		}

		self.tableView.snp.remakeConstraints {
			$0.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
		}
	}

	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
#endif
