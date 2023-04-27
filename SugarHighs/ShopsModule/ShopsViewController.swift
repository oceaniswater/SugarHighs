//
//  ShopsViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

class ShopsViewController: UIViewController {
    
    var presenter: ShopsViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCollectionView()
        setupSearchBar()
    }
    
    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bake shops"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.barTintColor = K.Design.appBackgroundColor
        search.backgroundColor = .clear
        search.searchTextField.backgroundColor = .white
        search.backgroundImage = UIImage()
        search.showsCancelButton = true
        search.tintColor = .black
        return search
    }()
    
    let shopsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()


}

// MARK: - Setup View
private extension ShopsViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ShopsViewController {
    func addSubview() {
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(shopsCollection)
    }
}

// MARK: - Setup Layout
private extension ShopsViewController {
    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        shopsCollection.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

// MARK: - ShopsViewProtocol
extension ShopsViewController: ShopsViewProtocol {
    func success() {
        DispatchQueue.main.async {
            self.reloadColectionView()
        }
    }
}
