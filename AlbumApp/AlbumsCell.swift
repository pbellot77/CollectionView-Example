//
//  AlbumsCell.swift
//  AlbumApp
//
//  Created by Patrick Bellot on 2/8/18.
//  Copyright © 2018 Pavel Bogart. All rights reserved.
//

import UIKit

class AlbumsCell: UICollectionViewCell {
	
	var album: String? {
		didSet {
			if let imageName = album {
				imageView.image = UIImage(named: imageName)
			}
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.clipsToBounds = true
		iv.layer.cornerRadius = 15
		return iv
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setCellShadow()
		setUp()
	}
	
	func setUp() {
		addSubview(imageView)
		
		imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
