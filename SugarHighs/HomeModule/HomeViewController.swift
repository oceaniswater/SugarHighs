//
//  HomeViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupTableView()
        setupView()
    }
    
    
    // MARK: - Private Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want\nto eat today?"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    
    let categoriesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let popularButton: PopularButton = {
        let button = PopularButton()
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        return table
    }()
    
}

// MARK: - Setup View
private extension HomeViewController {
    func setupView() {        
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension HomeViewController {
    func addSubview() {
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(categoriesCollection)
        view.addSubview(popularButton)
        view.addSubview(tableView)
    }
}

// MARK: - Setup Layout
private extension HomeViewController {
    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(52)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        categoriesCollection.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(searchButton.snp.bottom).offset(40)
            make.height.equalTo(220)
        }
        
        popularButton.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollection.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(popularButton.snp.bottom).offset(20)
        }
        
        
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
