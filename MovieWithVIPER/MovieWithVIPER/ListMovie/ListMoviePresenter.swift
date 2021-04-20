//
//  ListMoviePresenter.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation

class ListMoviePresenter  {
    
    // MARK: Properties
    weak var view: ListMovieViewProtocol?
    var interactor: ListMovieInteractorInputProtocol?
    var wireFrame: ListMovieWireFrameProtocol?
    
}

extension ListMoviePresenter: ListMoviePresenterProtocol {

    

    func viewDidLoad() {
        // Vamos a pedirle al interactor los datos del servidor
        view?.showActivity()
        interactor?.getDataMovies()
    }
    
    func presentDetailMovie(with movieId: String) {
        wireFrame?.presentDetailMovie(from: view!, with: movieId)
    }
}

extension ListMoviePresenter: ListMovieInteractorOutputProtocol {
    func callbackDataMovies(with movies: [Movie]) {
        view?.callbackDataMovies(with: movies)
        view?.reloadTableView()
    }
}
