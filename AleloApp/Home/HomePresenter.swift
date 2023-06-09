import Foundation

protocol HomePresenterProtocol {
    func presentFetchResults(products: [Product])
}

public final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeDisplayLogic?
    
    func presentFetchResults(products: [Product]) {
        let viewModel = HomeViewController.ViewModel(products: products)
        view?.presentData(viewModel: viewModel)
    }
}
