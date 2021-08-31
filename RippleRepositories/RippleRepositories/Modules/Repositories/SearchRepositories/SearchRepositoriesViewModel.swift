//
//  SearchRepositoriesViewModel.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchRepositoriesViewModelOutput {
    func getSearchedQuery() -> String
    func validateQuery() -> Bool
    var isConnectionReachable: (PublishSubject<Bool>) { get set }
}

protocol SearchRepositoriesViewModelInput {
    func setSearchedQuery(query: String)
    func didPressSearchBtn()
}

class SearchRepositoriesViewModel:SearchRepositoriesViewModelOutput, SearchRepositoriesViewModelInput {
    
    private let useCase = SearchRepositoriesUseCase()
    private var searchQuery: String = ""
    var isConnectionReachable: (PublishSubject<Bool>) = .init()
    
    func getSearchedQuery() -> String {
        return searchQuery
    }
    
    func setSearchedQuery(query: String) {
        searchQuery = query
    }
    
    func validateQuery() -> Bool {
        return !getSearchedQuery().isBlank
    }
    
     func didPressSearchBtn() {
        isConnectionReachable.onNext(ReachabilityManager.isReachable())
    }
}
