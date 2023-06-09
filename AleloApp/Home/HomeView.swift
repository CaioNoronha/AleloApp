//
//  View.swift
//  MarvelFan
//
//  Created by Caio Noronha on 10/09/21.
//
import Cartography
import UIKit

public typealias ViewOwner = UICollectionViewDelegate & UICollectionViewDataSource

public final class HomeView: UIView, ViewCode {
   
    //MARK: - Attributes
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Bestie Buy"
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.textColor = .white
        return title
    }()
    
    private lazy var saleButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName:"pencil")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var productsCarousel: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        productsCarousel.dataSource = viewOwner
        productsCarousel.delegate = viewOwner
    }
    
    func build() {
        addSubview(titleLabel)
        addSubview(saleButton)
        addSubview(productsCarousel)
        
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
        
        constrain(titleLabel, saleButton, self) { title, button, view in
            button.top == title.bottom - 20
            button.trailing == view.trailing - 20
        }
        
        constrain(productsCarousel, saleButton, self) { collectionView, button, view in
            collectionView.leading == view.leading
            collectionView.trailing == view.trailing
            collectionView.bottom == view.bottom
            collectionView.top == button.bottom + 20
        }
    }
}

