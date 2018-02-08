//
//  ImagesCell.swift
//  AlbumApp
//
//  Created by Patrick Bellot on 2/8/18.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class ImagesCell: UICollectionViewCell {
	
	var images: [String]? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	private let cellId = "cellId"
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 30
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		return cv
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUp()
	}
	
	func setUp() {
		addSubview(collectionView)
		
		collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.showsHorizontalScrollIndicator = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private class IconsCell: UICollectionViewCell {
		
		let imageView: UIImageView = {
			let iv = UIImageView()
			iv.contentMode = .scaleAspectFill
			iv.clipsToBounds = true
			iv.layer.cornerRadius = 15
			return iv
		}()
		
		override init(frame: CGRect) {
			super.init(frame: frame)
			setup()
		}
		
		func setup() {
			setCellShadow()
			addSubview(imageView)
			
			imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
		}
		
		required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
}

extension ImagesCell: UICollectionViewDelegate {
}

extension ImagesCell: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
		if let imageName = images?[indexPath.item] {
			cell.imageView.image = UIImage(named: imageName)
		}
		return cell
	}
}

extension ImagesCell: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 200, height: frame.height - 20)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
	}
}
