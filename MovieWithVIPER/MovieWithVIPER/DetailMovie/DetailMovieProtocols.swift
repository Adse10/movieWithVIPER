//
//  DetailMovieProtocols.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

protocol DetailMovieViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailMoviePresenterProtocol? { get set }
}

protocol DetailMovieWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailMovieModule(with movieId: String) -> UIViewController
}

protocol DetailMoviePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailMovieViewProtocol? { get set }
    var interactor: DetailMovieInteractorInputProtocol? { get set }
    var wireFrame: DetailMovieWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol DetailMovieInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetailMovieInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailMovieInteractorOutputProtocol? { get set }
    var localDatamanager: DetailMovieLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailMovieRemoteDataManagerInputProtocol? { get set }
}

protocol DetailMovieDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailMovieRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailMovieRemoteDataManagerOutputProtocol? { get set }
}

protocol DetailMovieRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetailMovieLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
