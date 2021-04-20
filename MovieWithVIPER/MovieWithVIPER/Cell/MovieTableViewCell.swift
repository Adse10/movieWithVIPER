//
//  MovieTableViewCell.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbOverview: UILabel!
    
    var movie: Movie?{
        didSet{
            if let movie = movie{
                lbTitle.text = movie.title
                lbOverview.text = movie.sinopsis
                imgMovie.imageFromServerURL(urlString: "\(Constants.URL.baseImages + movie.image)")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
