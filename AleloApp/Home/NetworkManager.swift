import Foundation

protocol NetworkManagerProtocol {
    func createRequest(for url: String) -> URLRequest?
    func executeRequest(request: URLRequest, completion: @escaping (Result<[Product], NetworkError>) -> Void)
}

enum NetworkError: Error {
    case invalidUrl
    case invalidData
}

public struct NetworkManager: NetworkManagerProtocol {
    
    func createRequest(for url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func executeRequest(request: URLRequest, completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            if let decodedData = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
}
