//
//  MovieCellTableViewCell.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit
import Kingfisher

class MovieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var movieUIImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(movie: MovieEntity){
        titleLabel.text = movie.title
        movieUIImage.kf.setImage(with: movie.posterURL,placeholder: UIImage(named: "imagePlaceholder"))
    }
    
}
