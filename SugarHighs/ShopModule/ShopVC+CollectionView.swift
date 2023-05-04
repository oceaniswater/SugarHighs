//
//  ShopVC+CollectionView.swift
//  SugarHighs
//
//  Created by Mark Golubev on 04/05/2023.
//

import Foundation
import UIKit

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func reloadColectionView() {
        DispatchQueue.main.async {
            self.tagsItemCollection.reloadData()
        }

    }
    
    func setupCollectionView() {

        self.tagsItemCollection.delegate = self
        self.tagsItemCollection.dataSource = self
        
        registerCollectionCell()
    }
    
    func registerCollectionCell() {
        self.tagsItemCollection.register(TagCollectionCell.self, forCellWithReuseIdentifier: TagCollectionCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.numberOfItemsInSection(in: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter.numberOfSection()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionCell.identifier, for: indexPath) as! TagCollectionCell
        if let tag = presenter.tags?[indexPath.row]{
            cell.configure(with: tag)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let shop = presenter.shops[indexPath.row] {
//            presenter.tapToShop(shop: shop)
//        }
    }
    
    
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

}
