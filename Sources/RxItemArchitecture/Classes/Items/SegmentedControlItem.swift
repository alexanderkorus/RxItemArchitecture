//
//  SegmentedControlItem.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 15.01.21.
//
#if canImport(UIKit)
import Foundation
import RxCocoa
import RxSwift
import UIKit

public struct SegmentedControlItem: BaseItem {

	public var type: BaseCell.Type {
		SegmentedControlCell.self
	}

	public var controlType: SegmentControlType
	public var segments: [String]
	public var selectedSegment: BehaviorRelay<Int>
	public var segmentsDisabled: [Int] = []

	public var selectedSegmentFont: UIFont = UIFont.boldSystemFont(ofSize: 14.0)
	public var selectedSegmentFontColor: UIColor = UIColor.black
	public var segmentFont: UIFont = UIFont.systemFont(ofSize: 14.0)
	public var segmentFontColor: UIColor = UIColor.black
	public var disabledSegmentFontColor: UIColor = UIColor.lightGray
	public var selectorColor: UIColor = UIColor.black

	public enum SegmentControlType {
		case apple
		//case material
	}

	public init(controlType: SegmentedControlItem.SegmentControlType = .apple, segments: [String], selectedSegment: BehaviorRelay<Int>, segmentsDisabled: [Int] = [], selectedSegmentFont: UIFont = UIFont.boldSystemFont(ofSize: 14.0), selectedSegmentFontColor: UIColor = UIColor.black, segmentFont: UIFont = UIFont.systemFont(ofSize: 14.0), segmentFontColor: UIColor = UIColor.black, disabledSegmentFontColor: UIColor = UIColor.lightGray, selectorColor: UIColor = UIColor.black) {
		self.controlType = controlType
		self.segments = segments
		self.selectedSegment = selectedSegment
		self.segmentsDisabled = segmentsDisabled
		self.selectedSegmentFont = selectedSegmentFont
		self.selectedSegmentFontColor = selectedSegmentFontColor
		self.segmentFont = segmentFont
		self.segmentFontColor = segmentFontColor
		self.disabledSegmentFontColor = disabledSegmentFontColor
		self.selectorColor = selectorColor
	}
}

class SegmentedControlCell: UITableViewCell, BaseCell {

	typealias T = SegmentedControlItem
	static var identifier: String = "SegmentedControlCell"

	// MARK: - Subviews
	//var segmentControl: SSegmentControl?

	let appleSegmentControl: UISegmentedControl = {
		let view = UISegmentedControl()
		view.apportionsSegmentWidthsByContent = true
		return view
	}()

	// MARK: - Stored properties
	var selectedSegment: BehaviorRelay<Int> = BehaviorRelay<Int>(value: 0)
	var bag: DisposeBag = DisposeBag()

	// MARK: - Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .white
		selectionStyle = .none
	}

	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		bag = DisposeBag()
		//segmentControl?.removeFromSuperview()
		//segmentControl?.segments = []
		//segmentControl?.segmentDidChanged = nil

		appleSegmentControl.removeFromSuperview()
	}

	// MARK: - Instance methods
	func layout(item: Any) {

		guard let item = item as? T else { return }

		self.selectedSegment = item.selectedSegment
		//self.segmentControl = nil

		/*if item.controlType == .material {

			self.segmentControl = makeSegmentControl()
			guard let segmentControl = self.segmentControl else { return }
			segmentControl.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(segmentControl)

			segmentControl.snp.remakeConstraints {
				$0.top.equalToSuperview()
				$0.leading.equalToSuperview()
				$0.trailing.equalToSuperview()
				$0.height.equalTo(60.0)
				$0.bottom.equalToSuperview()
			}

			segmentControl.segments = item.segments.enumerated().map {
				let label = UILabel()
				label.text = $1
				label.font = $0 == item.selectedSegment.value ? item.selectedSegmentFont : item.segmentFont
				if item.segmentsDisabled.contains($0) {
					label.textColor = item.disabledSegmentFontColor
				} else {
					label.textColor = $0 == item.selectedSegment.value
						? item.selectedSegmentFontColor
						: item.segmentFontColor
				}
				label.textAlignment = .center
				return label
			}

			segmentControl.selectorColor = item.selectorColor

			segmentControl.disabledSegments = item.segmentsDisabled

			segmentControl.setIndex(to: item.selectedSegment.value)

			segmentControl.segmentDidChanged = { [weak self] index, view in

				guard let self = self else { return }
				self.selectedSegment.accept(index)
			}

		} else {*/

			appleSegmentControl.removeAllSegments()
			appleSegmentControl.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(appleSegmentControl)

			appleSegmentControl.snp.remakeConstraints {
				$0.top.equalToSuperview().offset(20.0)
				$0.centerX.equalToSuperview()
				$0.bottom.equalToSuperview().offset(-10.0)
			}

			for (index, segment) in item.segments.enumerated() {
				appleSegmentControl.insertSegment(withTitle: segment, at: index, animated: false)
			}

			appleSegmentControl.selectedSegmentIndex = item.selectedSegment.value

			appleSegmentControl.addTarget(self, action: #selector(appleSegmentChanged), for: .valueChanged)
		//}
	}

	@objc func appleSegmentChanged() {
		self.selectedSegment.accept(appleSegmentControl.selectedSegmentIndex)
	}

	/*func makeSegmentControl() -> SSegmentControl {
		let view: SSegmentControl = SSegmentControl()
		// Configure appearance of segmentControl
		view.isShadowHidden = true
		return view
	}*/
}
#endif
