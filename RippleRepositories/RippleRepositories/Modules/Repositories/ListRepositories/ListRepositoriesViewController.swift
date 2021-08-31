//
//  ListRepositoriesViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit
import Toast_Swift
import RxCocoa
import RxSwift

class ListRepositoriesViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak private var repositoriesTableView: UITableView!
    
    private var viewModel: ListRepositoriesViewModel!
    private var shouldShowEmptyListState: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    func initialize(with viewModel: ListRepositoriesViewModel) {
        self.viewModel = viewModel
        searchForRepositories()
    }
    
    private func setupUI() {
        title = Strings.REPOSITORIES_LIST
        setupRepositoriesTableView()
    }
    
    private func setupRepositoriesTableView() {
        let repositoryCell = UINib(nibName: RepositoryCell.ID, bundle: nil)
        repositoriesTableView.estimatedRowHeight = 120
        repositoriesTableView.rowHeight = UITableView.automaticDimension
        repositoriesTableView.separatorStyle = .none
        repositoriesTableView.register(repositoryCell, forCellReuseIdentifier: RepositoryCell.ID)
    }
    
    private func setupTableView() {
        repositoriesTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.repositories.asObservable().bind(to: repositoriesTableView.rx.items(cellIdentifier: String(describing: RepositoryCell.self), cellType: RepositoryCell.self)) { [weak self] index, model, cell in
            guard let self = self else { return }
            let info = self.viewModel.getRepositoryInfo(at: index)
            cell.bindCell(info: info)
        }.disposed(by: disposeBag)
    }
    
    private func searchForRepositories() {
        self.view.makeToastActivity(.center)
        viewModel.fetchRepositories {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.view.hideToastActivity()
                self.shouldShowEmptyListState = true
                self.repositoriesTableView.reloadData()
            }
        }
    }
}
