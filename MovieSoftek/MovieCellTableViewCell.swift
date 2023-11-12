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
    
    func configure(title: String, url:String){
        titleLabel.text = title
        let url = URL(string: url)
        movieUIImage.kf.setImage(with: url,placeholder: UIImage(named: "imagePlaceholder"))
    }
    
}
