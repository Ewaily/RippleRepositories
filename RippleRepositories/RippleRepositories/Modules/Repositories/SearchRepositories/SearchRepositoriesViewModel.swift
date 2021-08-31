//
//  SearchRepositoriesViewModel.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

protocol SearchRepositoriesViewModelOutput {
    func getSearchedQuery() -> String
    func validateQuery() -> Bool
}

protocol SearchRepositoriesViewModelInput {
    func setSearchedQuery(query: String)
}

class SearchRepositoriesViewModel:SearchRepositoriesViewModelOutput, SearchRepositoriesViewModelInput {
    
    private let useCase = SearchRepositoriesUseCase()
    private var searchQuery: String = ""
    
    
    func getSearchedQuery() -> String {
        return searchQuery
    }
    
    func setSearchedQuery(query: String) {
        searchQuery = query
    }
    
    func validateQuery() -> Bool {
        return !getSearchedQuery().isBlank
    }
}
