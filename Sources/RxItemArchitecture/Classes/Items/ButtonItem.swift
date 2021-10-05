//
//  ButtonItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 06.10.21.
//
#if canImport(UIKit)
import UIKit
import RxSwift
import RxCocoa

public struct ButtonItem: BaseItem {

	public var type: BaseCell.Type {
		ButtonCell.self
	}

	public var title: String
	public var styling: (UIButton) -> Void
	public var onTap: () -> Void
	public var height: CGFloat = 40.0
	public var sideSpace: CGFloat = 20.0
	public var topSpace: CGFloat = 10.0
	public var bottomSpace: CGFloat = 20.0

	public init(
		title: String,
		styling: @escaping (UIButton) -> Void,
		onTap: @escaping () -> Void,
		height: CGFloat = 40.0,
		sideSpace: CGFloat = 20.0,
		topSpace: CGFloat = 10.0,
		bottomSpace: CGFloat = 20.0
	) {
		self.title = title
		self.styling = styling
		self.onTap = onTap
		self.height = height
		self.sideSpace = sideSpace
		self.topSpace = topSpace
		self.bottomSpace = bottomSpace
	}
}

open class ButtonCell: UITableViewCell, BaseCell {

	public static var identifier: String = "ButtonCell"
	typealias T = ButtonItem

	// MARK: - Subviews
	public let button: UIButton = UIButton()

	// MARK: - Stored properties
	public var bag: DisposeBag = DisposeBag()

	// MARK: - Initializers
	public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .clear
		selectionStyle = .none

		button.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(button)

		self.button.snp.remakeConstraints {
			$0.top.equalToSuperview().offset(10.0)
			$0.leading.equalToSuperview().offset(20.0)
			$0.trailing.equalToSuperview().offset(-20.0)
			$0.bottom.equalToSuperview().offset(-20.0)
			$0.height.equalTo(40.0)
		}
	}

	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func prepareForReuse() {
		super.prepareForReuse()

		bag = DisposeBag()
	}

	// MARK: - Instance methods
	public func layout(item: Any) {
		guard let item = item as? T else { return }

		button.setTitle(item.title, for: .normal)
		item.styling(button)

		self.button.rx.tap
			.bind { _ in
				item.onTap()
			}
			.disposed(by: bag)

		self.button.snp.remakeConstraints {
			$0.top.equalToSuperview().offset(item.topSpace)
			$0.leading.equalToSuperview().offset(item.sideSpace)
			$0.trailing.equalToSuperview().offset(-item.sideSpace)
			$0.bottom.equalToSuperview().offset(-item.bottomSpace)
			$0.height.equalTo(item.height)
		}
	}
}
#endif
