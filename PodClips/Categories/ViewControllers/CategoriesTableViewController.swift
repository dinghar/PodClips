//
//  CategoriesTableViewController.swift
//  PodClips
//
//  Created by Ross Harding on 10/23/20.
//

import UIKit

protocol CategoriesTableViewControllerDelegate {
    func controllerDidSelectCategory(category: Category)
}

class CategoriesTableViewController: ParentTableViewController {
    
    var viewModel: CategoriesTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        configureViewModel(for: nil)
        registerTableViewCell()
        fetchData()
    }
    
    func fetchData() {
        presentLoadingView()
        dataManager.fetchUserData { userData in
            self.hideLoadingView()
            self.configureViewModel(for: userData)
            self.tableView.reloadData()
        }
    }
    
    func configureViewModel(for userData: UserData?) {
        let viewModel = CategoriesTableViewModel(userData: userData)
        self.viewModel = viewModel
    }
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        let category = viewModel.category(at: indexPath.row)
        let viewModel = CategoryTableCellViewModel(category: category)
        cell.configureData(with: viewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let category = viewModel?.category(at: indexPath.row) else {
            return
        }
        controllerDidSelectCategory(category: category)
    }
    
}
