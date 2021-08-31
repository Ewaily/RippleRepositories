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
        let searchRecipesView = SearchRepositoriesViewController.instantiate(storyboard: .REPOSITORIES)
        navigationController.pushViewController(searchRecipesView, animated: true)
    }
    
//    func pushRepositoriesList(query: String) {
//        let recipesListView = RecipesListView.instantiate(storyboard: .RECIPES)
//        let viewModel = RecipesListViewModel(query: query)
//        recipesListView.initialize(with: viewModel)
//        navigationController.pushViewController(recipesListView, animated: true)
//    }
}
