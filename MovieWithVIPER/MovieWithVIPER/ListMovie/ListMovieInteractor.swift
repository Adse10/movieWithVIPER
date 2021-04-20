//
//  ListMovieInteractor.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation

class ListMovieInteractor: ListMovieInteractorInputProtocol {

    

    // MARK: Properties
    weak var presenter: ListMovieInteractorOutputProtocol?
    var localDatamanager: ListMovieLocalDataManagerInputProtocol?
    var remoteDatamanager: ListMovieRemoteDataManagerInputProtocol?
    
    func getDataMovies() {
        // Le pedimos al RemoteDataManager que haga la llamada al WS
        remoteDatamanager?.getDataMovies()
    }

}

extension ListMovieInteractor: ListMovieRemoteDataManagerOutputProtocol {
    
    func callbackDataMovies(with data: Movies) {
        presenter?.callbackDataMovies(with: data.listOfMovies)
    }
}
