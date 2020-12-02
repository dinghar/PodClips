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
    
    var viewModel: CategoriesTableViewModel! {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        configureViewModel(for: [Category]())
        registerTableViewCell()
        fetchData()
    }
    
    func fetchData() {
        presentLoadingView()
        dataManager.fetchUserCategories { (userCategories) in
            self.hideLoadingView()
            self.configureViewModel(for: userCategories)
            self.tableView.reloadData()
        }
    }
    
    func configureViewModel(for categories: [Category]) {
        let viewModel = CategoriesTableViewModel(categories: categories)
        self.viewModel = viewModel
    }
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }

    @IBAction func addCategory(_ sender: Any) {
        var textfield: UITextField?
        let alert = UIAlertController(title: "Add Category", message: nil, preferredStyle: .alert)
        alert.addTextField { (newCategoryTextfield) in
            textfield = newCategoryTextfield
        }
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            guard let name = textfield?.text else {
                return
            }
            if !name.isEmpty && name.count > 0 {
                self.dataManager.addCategory(name) { (categories) in
                    self.configureViewModel(for: categories)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true) {
            
        }
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
