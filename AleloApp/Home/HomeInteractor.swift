import Foundation

protocol HomeBusinessLogic {
    func fetchItems()
}

public class Interactor: HomeBusinessLogic {
    
    let worker: HomeWorkerProtocol
    
    init(worker: HomeWorkerProtocol) {
        self.worker = worker
    }
    
    func fetchItems() {
        
        worker.fetchProductsData { result in
            
            switch result {
            case .success(let products):
                
            case .failure(let error):
                
            }
            
        }
    }
}
