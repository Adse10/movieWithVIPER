//
//  DetailMovieWireFrame.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

class DetailMovieWireFrame: DetailMovieWireFrameProtocol {

    class func createDetailMovieModule(with movieId: String) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailMovieView")
        if let view = viewController as? DetailMovieView {
            let presenter: DetailMoviePresenterProtocol & DetailMovieInteractorOutputProtocol = DetailMoviePresenter()
            let interactor: DetailMovieInteractorInputProtocol & DetailMovieRemoteDataManagerOutputProtocol = DetailMovieInteractor()
            let localDataManager: DetailMovieLocalDataManagerInputProtocol = DetailMovieLocalDataManager()
            let remoteDataManager: DetailMovieRemoteDataManagerInputProtocol = DetailMovieRemoteDataManager()
            let wireFrame: DetailMovieWireFrameProtocol = DetailMovieWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Movies", bundle: Bundle.main)
    }
    
}
