//
//  TestCVViewController.swift
//  RxItemArchitecture_Example
//
//  Created by Alexander Korus on 05.10.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import RxItemArchitecture

/*
 ViewModel: BaseCollectionItemViewModel<State>,
 State: BaseCollectionItemState,
 View: BaseCollectionView
 */

class TestCVViewController: BaseCollectionItemViewController<
	TestCVViewModel,
	TestCVState,
	BaseCollectionView
> {

	override func viewDidLoad() {
		// have to be before
		collectionView.rx.setDelegate(self).disposed(by: bag)
		super.viewDidLoad()

	}
}

extension TestCVViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let widthPerItem = rootView.safeAreaLayoutGuide.layoutFrame.width
		var heightPerItem: CGFloat
		heightPerItem = rootView.safeAreaLayoutGuide.layoutFrame.height - 10.0

		return CGSize(width: widthPerItem, height: heightPerItem)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return sectionInsets
	}
}
