//
//  View.swift
//  MarvelFan
//
//  Created by Caio Noronha on 10/09/21.
//
import Cartography
import UIKit

public typealias ViewOwner = UITableViewDelegate & UICollectionViewDelegate & UITableViewDataSource & UICollectionViewDataSource

final class HomeView: UIView, ViewCode {
   
    //MARK: - Attributes
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Bestie Buy"
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.textColor = .white
        return title
    }()
    
    private lazy var filterCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "FilterCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private lazy var characterCarousel: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
        tableView.rowHeight = 70
        //tableView.rowHeight = 200
        tableView.backgroundColor = Color.darkBlue
        tableView.separatorColor = Color.lightBlue
        return tableView
    }()
    
    //MARK: - Initializer
    
    init(viewOwner: ViewOwner) {
        super.init(frame: .zero)
        setup()
        register(viewOwner: viewOwner)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    //MARK: - Methods
    
    private func register(viewOwner: ViewOwner) {
        characterCarousel.dataSource = viewOwner
        characterCarousel.delegate = viewOwner
        
        filterCarousel.dataSource = viewOwner
        filterCarousel.delegate = viewOwner
    }
    
    func build() {
        addSubview(titleLabel)
        addSubview(filterCarousel)
        addSubview(characterCarousel)
        
        self.backgroundColor = Color.darkBlue
    }
    
    func setupConstrains() {
        
        ///leading = left
        ///trailing = right
        ///Botton = Under/BaseLine
        
        constrain(titleLabel, self) { title, view in
            title.top == view.topMargin
            title.leading == view.leadingMargin
        }

        constrain(filterCarousel, titleLabel, self) { collectionView, titleLabel, view in
            collectionView.leading == view.leading
            collectionView.trailing == view.trailing
            collectionView.height == 40
            collectionView.top == titleLabel.bottom + 10
        }

        constrain(characterCarousel, filterCarousel, self) { tableView, filter, view in
            tableView.leading == view.leading
            tableView.trailing == view.trailing
            tableView.bottom == view.bottom
            tableView.top == filter.bottom + 10
        }
    }
}

