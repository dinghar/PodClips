//
//  PodcastClipViewController.swift
//  PodClips
//
//  Created by Ross Harding on 11/18/20.
//

import UIKit

class PodcastClipViewController: UIViewController {
    
    var viewModel: PodcastClipViewModel!

    @IBOutlet weak var podcastClipName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        podcastClipName.text = viewModel.name
    }

}
