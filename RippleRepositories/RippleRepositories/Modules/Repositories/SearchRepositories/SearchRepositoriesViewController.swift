//
//  SearchRepositoriesViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

class SearchRepositoriesViewController: BaseViewController {

    @IBOutlet weak private var searchTextField  : SearchTextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(viewModel.getSearchedQuery())
    }
    
    private var viewModel: SearchRepositoriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SearchRepositoriesViewModel()
        setupUI()
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
        searchButton.cornerRadius = Constants.SEARCH_BUTTON_CORNER_RADIUS
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
        guard let text = textField.text else {return}
        viewModel.setSearchedQuery(query: text)
    }
}
