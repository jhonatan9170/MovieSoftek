//
//  MovieDetailViewController.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController,MovieDetailViewProtocol {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var presenter: MovietDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
    }
    
    func showMovieDetail(with movie: MovieEntity) {
        self.title = movie.title
        movieImage.kf.setImage(with: movie.posterURL,placeholder: UIImage(named: "imagePlaceholder"))
        titleLabel.text = movie.title
        reviewLabel.text = movie.rating
        releaseDateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview

        
    }
}

