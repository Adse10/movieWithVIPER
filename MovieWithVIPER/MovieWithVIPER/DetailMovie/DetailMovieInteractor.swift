//
//  DetailMovieInteractor.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation

class DetailMovieInteractor: DetailMovieInteractorInputProtocol {

    

    // MARK: Properties
    weak var presenter: DetailMovieInteractorOutputProtocol?
    var localDatamanager: DetailMovieLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailMovieRemoteDataManagerInputProtocol?
    
    func getDataDetailMovie(movieId: String) {
        remoteDatamanager?.getDataDetailMovie(movieId: movieId)
    }

}

extension DetailMovieInteractor: DetailMovieRemoteDataManagerOutputProtocol {
    func callBackDetailMovie(with movie: Movie) {
        presenter?.callBackDetailMovie(with: movie)
    }
    
}
