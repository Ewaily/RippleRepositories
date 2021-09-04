//
//  NavigationManager.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

struct NavigationManager {
    
    let navigationController: UINavigationController
    
    func pushSearchRepositories() {
        let searchRepositoriesView = SearchRepositoriesViewController.instantiate(storyboard: .REPOSITORIES)
        navigationController.pushViewController(searchRepositoriesView, animated: true)
    }
    
    func pushRepositoriesList(query: String) {
        let rpositoriesListView = ListRepositoriesViewController.instantiate(storyboard: .REPOSITORIES)
        let repository = ListRepositoriesRepository(remote: RepositoriesAPI())
        let useCase = ListRepositoriesUseCase(repository: repository)
        let viewModel = ListRepositoriesViewModel(query: query, useCase: useCase)
        rpositoriesListView.initialize(with: viewModel)
        navigationController.pushViewController(rpositoriesListView, animated: true)
    }
}
