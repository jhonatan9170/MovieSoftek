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
    
    private let presenter: MovietDetailPresenterProtocol
    
    init(presenter: MovietDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "MovieDetailViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(with: presenter.movie)
    }
    
    func updateView(with movie: MovieEntity) {
        self.title = movie.title
        movieImage.kf.setImage(with: movie.posterURL,placeholder: UIImage(named: "imagePlaceholder"))
        titleLabel.text = movie.title
        reviewLabel.text = movie.rating
        releaseDateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
        
    }
}

