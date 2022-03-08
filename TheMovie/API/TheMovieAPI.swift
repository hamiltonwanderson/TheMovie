//
//  TheMovieAPI.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 18/02/22.
//

import Foundation
import UIKit

class TheMovieAPI {

    let apiURL = "https://api.themoviedb.org/3"
    let apiKey = "d5383d7b5d84d1a1be6d85ec295e4051"

    func getMovieDetails(movieID: Int, completionHandler:@escaping (MovieDetails) -> Void) {
        let movieURL = URL(string: "\(apiURL)/movie/\(movieID)?api_key=\(apiKey)")

        let task = URLSession.shared.dataTask(with: movieURL!) { data, response, error in
            do {
                let movie = try JSONDecoder().decode(MovieDetails.self, from: data!)
                completionHandler(movie)
            } catch let error {
                debugPrint("error \(error)")
            }
        }

        task.resume()
        
    }
    
    func getSimilarMovies(movieID: Int, completionHandler:@escaping (SimilarMovies) -> Void) {
        let similarMoviesURL = URL(string: "\(apiURL)/movie/\(movieID)/similar?api_key=\(apiKey)&page=1")
        
        let task = URLSession.shared.dataTask(with: similarMoviesURL!) { data, response, error in
            do {
                let similarMovies = try JSONDecoder().decode(SimilarMovies.self, from: data!)
                completionHandler(similarMovies)
            } catch let error {
                debugPrint("error \(error)")
            }
        }
        
        task.resume()
        
    }
    
    static func getImageURL(posterPath: String) -> URL? {
        let url = "https://image.tmdb.org/t/p/w500" + posterPath
        return URL(string: url)
    }
    
}
