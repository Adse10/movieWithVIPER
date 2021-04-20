//
//  UIImageExtension.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//

import UIKit

extension UIImageView {
    
    func imageFromServerURL(urlString: String){
        
        if self.image == nil {
            self.image = UIImage(named: "poster")
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            if error != nil{
                return
            }
            
            DispatchQueue.main.async {
                
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }

}
