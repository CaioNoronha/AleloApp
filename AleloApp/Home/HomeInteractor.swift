import Foundation

protocol HomeBusinessLogic {
    func fetchItems()
}

public class Interactor: HomeBusinessLogic {
    func fetchItems() {
//        func getItems(completion: @escaping (NSError?, Bool, ArticlesModel.MostPopularArticle?) -> Void) {
//
//               NetworkService.shared.request(endpoint: ArticlesEndpoint.mostPopular, success: { (responseData) in
//                   let response = responseData
//                   do {
//                       let decoder = JSONDecoder()
//                       let data = try decoder.decode(ArticlesModel.MostPopularArticle.self, from: response)
//                       print(data)
//                       completion(nil , true , data)
//                   } catch let error {
//                       print("error : ", error.localizedDescription)
//                       completion(error as NSError , true , nil)
//                   }
//               })
//           }
    }
}
