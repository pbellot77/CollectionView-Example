//
//  ViewController.swift
//  AlbumApp
//
//  Created by Pavel Bogart on 2/10/17.
//  Copyright © 2017 Pavel Bogart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	private let imagesCellId = "imagesCellId"
	private let albumsCellId	 = "albumsCellId"
	let imagesArray = ["image1", "image2", "image3", "image4", "image5"]
	let albumsArray = ["album1", "album2","album3", "album4", "album5", "album6", "album7", "album8", "album9"]
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 16
		layout.scrollDirection = .vertical
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		return cv
	}()
	
	let backgrounImageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.image = UIImage(named: "bg")
		return iv
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}
	
	func setupViews() {
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.register(ImagesCell.self, forCellWithReuseIdentifier: imagesCellId)
		collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: albumsCellId)
		
		view.addSubview(backgrounImageView)
		view.addSubview(collectionView)
		
		backgrounImageView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
		collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
	}
}

extension ViewController: UICollectionViewDelegate {
	
}

extension ViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 1 {
			return albumsArray.count
		}
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.section == 1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! AlbumsCell
			cell.album = albumsArray[indexPath.item]
			return cell
		}
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! ImagesCell
		cell.images = imagesArray
		return cell
	}
}

extension ViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.section == 1 {
			return CGSize(width: (view.frame.width / 3) - 16, height: 100)
		}
		return CGSize(width: view.frame.width, height: 300)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if section == 1 {
			return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
		}
		return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
	}
		
		
		
		
		
		
}
