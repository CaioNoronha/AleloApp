import Foundation

protocol HomeWorkerProtocol {
    func fetchProductsData(completion: @escaping (Result<[Product], NetworkError>) -> Void)
}

public final class HomeWorker: HomeWorkerProtocol {
    
    private let network: NetworkManagerProtocol
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func fetchProductsData(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let request = network.createRequest(for: "http://www.mocky.io/v2/59b6a65a0f0000e90471257d") else {
            completion(.failure(.invalidUrl))
                return
            }
        
        network.executeRequest(request: request) { result in
            completion(result)
        }
    }
}
