//
//  ListMovieView.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

class ListMovieView: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var listMovies = [Movie]()

    // MARK: Properties
    var presenter: ListMoviePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Cargamos estilos y configuraciones
        loadStyle()
        // Registramos celdas
        registersCells()
        presenter?.viewDidLoad()
    }
    
    private func loadStyle(){
        title = NSLocalizedString("titleList", comment: "")
        activityIndicator.hidesWhenStopped = true
    }
    
    private func registersCells(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension ListMovieView: ListMovieViewProtocol {
    
    func reloadTableView() {
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func showActivity() {
        
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        
    }
    
    func callbackDataMovies(with movies: [Movie]) {
        listMovies = movies
    }
    
}

extension ListMovieView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentDetailMovie(with: String(listMovies[indexPath.row].movieID))
    }
    
}

extension ListMovieView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell
        cell?.movie = listMovies[indexPath.row]
        cell!.lbTitle.text = listMovies[indexPath.row].title
        return cell!
    }
    
    
}
