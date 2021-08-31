//
//  ListRepositoriesViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit
import Toast_Swift

class ListRepositoriesViewController: BaseViewController {
    
    @IBOutlet weak private var repositoriesTableView: UITableView!
    
    private var viewModel: ListRepositoriesViewModel!
    private var shouldShowEmptyListState: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = Strings.REPOSITORIES_LIST
        setupRepositoriesTableView()
    }
    
    private func setupRepositoriesTableView() {
        let emptyStateCell = UINib(nibName: TableEmptyStateCell.ID, bundle: nil)
        let repositoryCell = UINib(nibName: RepositoryCell.ID, bundle: nil)
        
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
        repositoriesTableView.estimatedRowHeight = 120
        repositoriesTableView.rowHeight = UITableView.automaticDimension
        repositoriesTableView.separatorStyle = .none
        repositoriesTableView.register(emptyStateCell, forCellReuseIdentifier: TableEmptyStateCell.ID)
        repositoriesTableView.register(repositoryCell, forCellReuseIdentifier: RepositoryCell.ID)
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
    
    func initialize(with viewModel: ListRepositoriesViewModel) {
        self.viewModel = viewModel
        searchForRepositories()
    }
}

// MARK: - Conforming to UITableView Delegate
extension ListRepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

// MARK: - Conforming to UITableView Data Source
extension ListRepositoriesViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowEmptyState() {
            return 1
        }
        return viewModel.countRepositories()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if shouldShowEmptyState() {
            return instantiateEmptyStatetCell(tableView, indexPath)
        }
        return instantiateSearchResultCell(tableView, indexPath)
    }

    private func shouldShowEmptyState() -> Bool {
        if !ReachabilityManager.isReachable() {
            return true
        }
        if shouldShowEmptyListState && viewModel.countRepositories() == 0 {
            return true
        } else {
            return false
        }
    }
    
    private func instantiateSearchResultCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.ID) as? RepositoryCell else {
            return UITableViewCell()
        }
        let info = viewModel.getRepositoryInfo(at: indexPath.row)
        cell.bindCell(info: info)
        return cell
    }
    
    private func instantiateEmptyStatetCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableEmptyStateCell.ID) as? TableEmptyStateCell else {
            return UITableViewCell()
        }
        let image = getEmptyStateImage()
        cell.setEmptyStateImage(image: image)
        return cell
    }
    
    private func getEmptyStateImage() -> UIImage? {
        if !ReachabilityManager.isReachable() {
            return Images.NO_INTERNET_IMAGE
        }
        return Images.NO_SEARCH_RESULTS
    }
}
