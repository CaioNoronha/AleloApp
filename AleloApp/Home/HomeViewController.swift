//
//  ViewController.swift
//  AleloApp
//
//  Created by Caio Noronha on 07/06/23.
//

import UIKit
import Cartography

protocol HomeDisplayLogic: AnyObject {
    func presentData(viewModel: HomeViewController.ViewModel)
}


class HomeViewController: UIViewController {
    
    private let interactor: HomeBusinessLogic
    //private let router: HomeRouterProtocol
        
    private var viewModel: ViewModel = ViewModel(products: [])
    
    init(interactor: HomeBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = HomeView(viewOwner: self)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCell else { return }
        cell.backgroundColor = Color.lightPurple
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCell else { return }
        cell.backgroundColor = Color.lightBlue

    }
}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        
        let product = viewModel.products[indexPath.row]
        let viewModel = HomeCell.ViewModel(product: product)
        
        cell.configure(with: viewModel)
        
        return cell
    }
}

//MARK: - ViewModel
extension HomeViewController {
    
    public struct ViewModel {
        var products: [Product]
    }
}
