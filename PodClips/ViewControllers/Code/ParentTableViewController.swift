//
//  ParentTableViewController.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import UIKit

class ParentTableViewController: UITableViewController {
    
    var loadingView = UIActivityIndicatorView()
    
    lazy var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoadingView()
    }
    
    // MARK: - Convenience
    
    func configureLoadingView() {
        loadingView.hidesWhenStopped = true
        loadingView = UIActivityIndicatorView(frame:
                                                CGRect(x: view.frame.midX - 30,
                                                       y: view.frame.midY - 30,
                                                       width: 60,
                                                       height: 60))
        loadingView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.7)
        loadingView.layer.cornerRadius = 8
        view.addSubview(loadingView)
    }
    
    func presentLoadingView() {
        loadingView.startAnimating()
    }
    
    func hideLoadingView() {
        loadingView.stopAnimating()
    }
    
}

extension ParentTableViewController: CategoriesTableViewControllerDelegate {
    
    func controllerDidSelectCategory(category: Category) {
        let podcastClipsViewController = PodcastClipsTableViewController()
        let viewModel = PodcastClipsTableViewModel(category: category)
        podcastClipsViewController.viewModel = viewModel
        self.navigationController?.pushViewController(podcastClipsViewController, animated: true)
    }
}

extension ParentTableViewController: PodcastClipsTableViewControllerDelegate {
    
    func controllerDidSelectPodcastClip(podcastClip: PodcastClip) {
        let podcastClipViewController = PodcastClipViewController()
        let viewModel = PodcastClipViewModel(podcastClip: podcastClip)
        podcastClipViewController.viewModel = viewModel
        self.navigationController?.pushViewController(podcastClipViewController, animated: true)
    }
}
