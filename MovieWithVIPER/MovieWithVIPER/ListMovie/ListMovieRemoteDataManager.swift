//
//  ListMovieRemoteDataManager.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//  
//

import Foundation

class ListMovieRemoteDataManager:ListMovieRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ListMovieRemoteDataManagerOutputProtocol?
    var listMovies: Movies?
    
    func getDataMovies() {
        // Realizamos la llamada para obtener los datos del servidor
        let session = URLSession.shared
        // Creamos la petición url
        var request = URLRequest(url: URL(string: Constants.URL.base + Constants.Endpoints.movieList + Constants.apiKey)!)
        // Hacemos una llamada api rest. Configuramos la llamada por medio de cadenas o string. Si es para traer un json, siempre es igual
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        // Hacemos la petición
        session.dataTask(with: request) { (data, response, error) in
            // Gestionamos lo que hemos recibido. Convertimos el response en un objeto HttpURLResponse para gestionar el código de respuesta del servidor
            guard let data = data, error == nil, let responseWs = response as? HTTPURLResponse else{
                print("Ha habido un error en la conexión: \(error!.localizedDescription)")
                return
            }
            // Comprobamos el código del servidor
            if responseWs.statusCode == 200 {
                // Aquí ya se ha validado que la conexión ha ido bien y el servidor ha respondido un 200
                print("Traemos del server: \(data)")
                
                do {
                    let decoder = JSONDecoder()
                    self.listMovies = try decoder.decode(Movies.self, from: data)
                    
                    // Enviar de vuelta los datos al interactor
                    if let movies = self.listMovies{
                        self.remoteRequestHandler?.callbackDataMovies(with: movies)
                    }
                    
                } catch let error {
                    print("No se ha podido parsear el archivo, error: \(error.localizedDescription)")
                }
            } else{
                print("Ha ocurrido un error: \(String(describing: error?.localizedDescription))")
            }
            
            // Comprobamos el código del servidor
        }.resume()
    }
    
    
}
