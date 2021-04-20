//
//  DetailMoviePresenter.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation

class DetailMoviePresenter:DetailMoviePresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailMovieViewProtocol?
    var interactor: DetailMovieInteractorInputProtocol?
    var wireFrame: DetailMovieWireFrameProtocol?
    
    var movieId: String?
    
    func viewDidLoad() {
        // Pedimos al interactor el dato del detalle
        if let movieId = movieId {
            interactor?.getDataDetailMovie(movieId: movieId)
        }
    }
}


extension DetailMoviePresenter: DetailMovieInteractorOutputProtocol {
    func callBackDetailMovie(with movie: Movie) {
        view?.callBackDetailMovie(with: movie)
    }

}
