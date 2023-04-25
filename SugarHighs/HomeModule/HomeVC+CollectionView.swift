//
//  HomeVC+CollectionView.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import Foundation

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView() {
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        self.residentsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        self.categoriesCollection.delegate = self
        self.categoriesCollection.dataSource = self
        
        registerCollectionCell()
    }
    
    func registerCollectionCell() {
        self.categoriesCollection.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.numberOfItemsInSection(in: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.presenter.numberOfSection()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as! CategoryCollectionCell
        if let category = presenter.categories?[indexPath.row] {
            cell.configure(with: category)
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let resident = presenter.residents[indexPath.row] {
//            presenter.tapOnTheCharacter(character: resident)
//        }
//    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
