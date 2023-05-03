//
//  ShopsVC+CollectionView.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import Foundation
import UIKit

extension ShopsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func reloadColectionView() {
        DispatchQueue.main.async {
            self.shopsCollection.reloadData()
        }

    }
    
    func setupCollectionView() {

        self.shopsCollection.delegate = self
        self.shopsCollection.dataSource = self
        
        registerCollectionCell()
    }
    
    func registerCollectionCell() {
        self.shopsCollection.register(ShopCollectionCell.self, forCellWithReuseIdentifier: ShopCollectionCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.numberOfItemsInSection(in: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter.numberOfSection()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionCell.identifier, for: indexPath) as! ShopCollectionCell
        if let shop = presenter.shops[indexPath.row] {
            cell.configure(with: shop)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let shop = presenter.shops[indexPath.row] {
            presenter.tapToShop(shop: shop)
        }
    }
    
    
}

extension ShopsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}

