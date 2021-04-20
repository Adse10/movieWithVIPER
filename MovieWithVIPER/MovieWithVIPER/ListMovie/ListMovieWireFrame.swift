//
//  ListMovieWireFrame.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

class ListMovieWireFrame: ListMovieWireFrameProtocol {


    class func createListMovieModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? ListMovieView {
            let presenter: ListMoviePresenterProtocol & ListMovieInteractorOutputProtocol = ListMoviePresenter()
            let interactor: ListMovieInteractorInputProtocol & ListMovieRemoteDataManagerOutputProtocol = ListMovieInteractor()
            let localDataManager: ListMovieLocalDataManagerInputProtocol = ListMovieLocalDataManager()
            let remoteDataManager: ListMovieRemoteDataManagerInputProtocol = ListMovieRemoteDataManager()
            let wireFrame: ListMovieWireFrameProtocol = ListMovieWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Movies", bundle: Bundle.main)
    }
    
    func presentDetailMovie(from view: ListMovieViewProtocol, with movieId: String) {
        let newDetailView = DetailMovieWireFrame.createDetailMovieModule(with: movieId)
        
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    
    
}
