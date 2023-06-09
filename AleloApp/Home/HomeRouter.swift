//
//  HomeRouter.swift
//  AleloApp
//
//  Created by Caio Noronha on 08/06/23.
//

import Foundation

protocol HomeRouterProtocol {
    func navigateToArticle(article_id : Int )
}
class HomeRouter: HomeRouterProtocol {

    weak var view: HomeViewController?
    
    init(view: HomeViewController?) {
        self.view = view
    }
    
    func navigateToArticle(article_id : Int){
        //view?.navigate(type: .modal, module: GeneralRoute.mostPopularArticles, completion: nil)
    }
}
