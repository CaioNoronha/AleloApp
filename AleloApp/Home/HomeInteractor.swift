import Foundation

protocol HomeBusinessLogic {
    func fetchItems()
}

public final class HomeInteractor: HomeBusinessLogic {
    
    let worker: HomeWorkerProtocol?
    let presenter: HomePresenterProtocol?
    
    init(worker: HomeWorkerProtocol, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func fetchItems() {
        worker?.fetchProductsData { [weak self] result in
            switch result {
            case .success(let products):
                self?.presenter?.presentFetchResults(products: products)
                
            case .failure(let error): break
                //self?.presenter?.showErrorAlert()
            }
        }
    }
}
