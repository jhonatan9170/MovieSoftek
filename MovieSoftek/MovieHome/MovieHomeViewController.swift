//
//  MovieHomeViewController.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit

class MovieHomeViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    var presenter: MovieHomePresenterProtocol?

    var movies =  [MovieEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupViews()
        presenter?.loadMovies()
    }
    
    func setupDelegates(){
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    func setupViews() {
        self.title = "Upcoming Movies"
        moviesTableView.register(UINib(nibName: "MovieCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieCellTableViewCell")
        moviesTableView.backgroundColor = .clear
        moviesTableView.contentInset = UIEdgeInsets(top: -36, left: 0, bottom: 0, right: 0)
        moviesTableView.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "")
    }
}

extension MovieHomeViewController: MovieHomeViewProtocol {
    func showMovies(with movies: [MovieEntity]) {
        self.movies = movies
        DispatchQueue.main.async {[weak self] in 
            self?.moviesTableView.reloadData()
        }
    }
    func updateLoading(isLoading: Bool) {
        DispatchQueue.main.async { [weak self] in
            isLoading ? self?.view.addSpinner() : self?.view.removeSpinner()
        }
    }
}
extension MovieHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellTableViewCell", for: indexPath) as? MovieCellTableViewCell else {
            return UITableViewCell()
        }
        let movie = movies[indexPath.row]
        cell.configure(movie: movie)
        cell.backgroundColor = .clear
        if indexPath.row == movies.count - 1 {
            presenter?.loadMovies()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        self.presenter?.showMovieSelection(with: movie)
    }
}
