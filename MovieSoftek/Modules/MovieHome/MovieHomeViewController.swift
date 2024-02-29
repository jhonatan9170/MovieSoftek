//
//  MovieHomeViewController.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit

class MovieHomeViewController: UIViewController {

    @IBOutlet private weak var moviesTableView: UITableView! {
        didSet{
            moviesTableView.register(UINib(nibName: "MovieCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieCellTableViewCell")
            moviesTableView.backgroundColor = .clear
            moviesTableView.contentInset = UIEdgeInsets(top: -36, left: 0, bottom: 0, right: 0)
            moviesTableView.backgroundColor = .clear
            moviesTableView.dataSource = self
            moviesTableView.delegate = self
        }
    }
    
    private let presenter: MovieHomePresenterProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.loadMovies()
    }
    
    private func setupView() {
        self.title = "Upcoming Movies"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "")
    }
    
    init(presenter: MovieHomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "MovieHomeViewController", bundle: Bundle.main)
        presenter.setViewProtocol(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieHomeViewController: MovieHomeViewProtocol {
    func showMovies() {
        moviesTableView.reloadData()
    }
    func updateLoading(isLoading: Bool) {
        isLoading ? view.addSpinner() : view.removeSpinner()
    }
}
extension MovieHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.movies.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellTableViewCell", for: indexPath) as? MovieCellTableViewCell else {
            return UITableViewCell()
        }
        let movie = presenter.movieCellAtIndex(indexPath.row)
        cell.configure(movie: movie)
        cell.backgroundColor = .clear
        if indexPath.row == presenter.movies.count - 1 {
            presenter.loadMovies()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showMovieSelection(with: indexPath.row)
    }
}
