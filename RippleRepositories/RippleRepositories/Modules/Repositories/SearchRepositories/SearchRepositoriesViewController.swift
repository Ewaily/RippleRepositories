//
//  SearchRepositoriesViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import RxCocoa
import RxSwift
import Toast_Swift
import UIKit

class SearchRepositoriesViewController: BaseViewController {
    @IBOutlet private var searchTextField: SearchTextField!
    @IBOutlet var searchButton: UIButton!
    
    private var viewModel: SearchRepositoriesViewModel!

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.view.hideAllToasts()
        viewModel.didPressSearchBtn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SearchRepositoriesViewModel()
        setupUI()
        handleBinding()
    }
    
    private func setupUI() {
        setupSearchTextField()
        setupSearchButton()
    }
    
    private func setupSearchTextField() {
        searchTextField.placeholder = Strings.FIND_A_REPOSITORY
        searchTextField.delegate = self
    }
    
    private func setupSearchButton() {
        searchButton.setTitle(Strings.SEARCH, for: .normal)
        searchButton.backgroundColor = Colors.SEARCH_BUTTON_BACKGROUND
        searchButton.setTitleColor(Colors.WHITE, for: .normal)
        searchButton.cornerRadius = Dimensions.APP_CORNER_RADIUS
    }
    
    private func openRepositoriesList() {
        guard let navigationController = navigationController else { return }
        let query = viewModel.getSearchedQuery()
        let navigationManger = NavigationManager(navigationController: navigationController)
        navigationManger.pushRepositoriesList(query: query)
    }
    
    private func handleBinding() {
        viewModel.isConnectionReachable.subscribe { [weak self] value in
            guard let self = self, let value = value.element else { return }
            if value {
                if self.viewModel.validateQuery() {
                    self.openRepositoriesList()
                }
                else {
                    self.view.makeToast(Strings.INVALID_SEARCH_QUERY)
                }
            }
            else {
                self.view.makeToast(Strings.NO_INTERNET_CONNECTION)
            }
        }.disposed(by: disposeBag)
    }
}

// MARK: - UITextFieldDelegate

extension SearchRepositoriesViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        viewModel.setSearchedQuery(query: "")
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard textField.text?.isEmpty ?? true else { return true }
        viewModel.setSearchedQuery(query: "")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        viewModel.setSearchedQuery(query: text)
    }
}
