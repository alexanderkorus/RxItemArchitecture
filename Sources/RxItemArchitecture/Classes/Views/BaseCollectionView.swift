//
//  BaseCollectionView.swift
//  RxItemArchitecture
//
//  Created by Alexander Korus on 06.10.21.
//

#if canImport(UIKit)
import UIKit

open class BaseCollectionView: UIView {

	public let collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .horizontal
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.minimumLineSpacing = 0
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = .white
		collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
		collectionView.isPagingEnabled = true
		collectionView.isScrollEnabled = true
		collectionView.registerBaseItems()
		return collectionView
	}()

	public override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white

		collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(collectionView)

		self.collectionView.snp.remakeConstraints {
			$0.top.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
		}
	}

	public required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
#endif
