//
//  SearchRepositoriesViewModel.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

class SearchRepositoriesViewModel {
    
    private let useCase = SearchRepositoriesUseCase()
    private var searchQuery: String = ""
    
    
    func getSearchedQuery() -> String {
        return searchQuery
    }
    
    func setSearchedQuery(query: String) {
        searchQuery = query
    }
}
