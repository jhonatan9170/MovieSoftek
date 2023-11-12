//
//  MovieHomeViewController.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit

class MovieHomeViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupViews()
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

extension MovieHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellTableViewCell", for: indexPath) as? MovieCellTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(title: "Saw X", url: "https://image.tmdb.org/t/p/w500/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg")
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
