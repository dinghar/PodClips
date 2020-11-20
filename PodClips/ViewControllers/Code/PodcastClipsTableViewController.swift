//
//  CategoryDetailTableViewController.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import UIKit

protocol PodcastClipsTableViewControllerDelegate {
    func controllerDidSelectPodcastClip(podcastClip: PodcastClip)
}

class PodcastClipsTableViewController: ParentTableViewController {
    
    var viewModel: PodcastClipsTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()
    }
    
    func registerTableViewCell() {
        tableView.register(UINib(nibName: "PodcastClipTableViewCell", bundle: nil), forCellReuseIdentifier: "PodcastClipTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastClipTableViewCell", for: indexPath) as? PodcastClipTableViewCell else {
            return UITableViewCell()
        }
        let podcastClip = viewModel.podcastClip(at: indexPath.row)
        let viewModel = PodcastClipCellViewModel(podcastClip: podcastClip)
        cell.configureData(with: viewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let podcastClip = viewModel?.podcastClip(at: indexPath.row) else {
            return
        }
        controllerDidSelectPodcastClip(podcastClip: podcastClip)
    }

}
