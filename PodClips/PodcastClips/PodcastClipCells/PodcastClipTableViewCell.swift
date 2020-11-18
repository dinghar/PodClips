//
//  PodcastClipTableViewCell.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import UIKit

class PodcastClipTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(with viewModel: PodcastClipCellViewModel) {
        title.text = viewModel.name
    }
    
}
