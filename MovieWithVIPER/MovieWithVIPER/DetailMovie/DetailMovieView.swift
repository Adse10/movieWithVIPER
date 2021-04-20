//
//  DetailMovieView.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation
import UIKit

class DetailMovieView: UIViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbBoldOverview: UILabel!
    @IBOutlet weak var lbOverview: UILabel!
    @IBOutlet weak var lbBoldOriginalTitle: UILabel!
    @IBOutlet weak var lbOriginalTitle: UILabel!
    @IBOutlet weak var lbBoldDate: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    

    // MARK: Properties
    var presenter: DetailMoviePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Creamos los estilos
        loadStyle()
        // Llamamos al presentar para obtener los datos
        presenter?.viewDidLoad()
    }
    
    private func loadStyle(){
        lbBoldOverview.font = UIFont.boldSystemFont(ofSize: 20)
        lbBoldDate.font = UIFont.boldSystemFont(ofSize: 20)
        lbBoldOriginalTitle.font = UIFont.boldSystemFont(ofSize: 20)
        lbTitle.font = UIFont.boldSystemFont(ofSize: 30)
        // Texts
        lbBoldOverview.text = NSLocalizedString("titleOverview", comment: "")
        lbBoldDate.text = NSLocalizedString("titleDate", comment: "")
        lbBoldOriginalTitle.text = NSLocalizedString("titleOriginalTitle", comment: "")
    }
}

extension DetailMovieView: DetailMovieViewProtocol {
    
    func callBackDetailMovie(with movie: Movie) {
        DispatchQueue.main.async {
            self.lbDate.text = movie.releaseDate
            self.lbTitle.text = movie.title
            self.lbOriginalTitle.text = movie.originalTitle
            self.lbOverview.text = movie.sinopsis
            self.imgMovie.imageFromServerURL(urlString: "\(Constants.URL.baseImages + movie.image)")
        }
    }
}
