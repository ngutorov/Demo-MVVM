//
//  TopMoviesViewCell.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class TopMoviesViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movieItem: Movie? {
        didSet {
            if let movie = movieItem {
                self.titleLabel.text = movie.title ?? ""
                self.overviewLabel.text = movie.overview ?? ""
                self.picture.setImage(withImageId: movie.poster_path ?? "", placeholderImage: UIImage(named: "imagePlaceholder")!)
                self.picture.contentMode = .scaleAspectFill
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
