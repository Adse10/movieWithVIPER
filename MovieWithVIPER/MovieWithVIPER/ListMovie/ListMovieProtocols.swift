//
//  ListMovieProtocols.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

protocol ListMovieViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListMoviePresenterProtocol? { get set }
    
    func callbackDataMovies(with movies: [Movie])
    func reloadTableView()
    func showActivity()
}

protocol ListMovieWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListMovieModule() -> UIViewController
    
    func presentDetailMovie(from view: ListMovieViewProtocol, with movieId: String)
}

protocol ListMoviePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListMovieViewProtocol? { get set }
    var interactor: ListMovieInteractorInputProtocol? { get set }
    var wireFrame: ListMovieWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func presentDetailMovie(with movieId: String)
}

protocol ListMovieInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func callbackDataMovies(with movies: [Movie])
}

protocol ListMovieInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListMovieInteractorOutputProtocol? { get set }
    var localDatamanager: ListMovieLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListMovieRemoteDataManagerInputProtocol? { get set }
    
    func getDataMovies()
}

protocol ListMovieDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ListMovieRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListMovieRemoteDataManagerOutputProtocol? { get set }
    
    func getDataMovies()
}

protocol ListMovieRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callbackDataMovies(with data: Movies)
}

protocol ListMovieLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
