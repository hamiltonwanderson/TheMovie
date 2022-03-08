//
//  MovieDetailsViewModel.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 28/02/22.
//

import Foundation

protocol MoviesDetailsViewModelDelegate: AnyObject {
    func updateTableView()
}

class MovieDetailsViewModel {
    
    weak var delegate: MoviesDetailsViewModelDelegate?
    
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private var api = TheMovieAPI()
    var similarMovies = SimilarMovies(results: [])
    var movie: MovieDetails?
    private var movieId = 550
    
    func callApi() {
        let group = DispatchGroup()
        
        group.enter()
        group.enter()
        
        api.getMovieDetails(movieID: movieId) { movieDetails in
            self.movie = movieDetails
            group.leave()
        }
        
        api.getSimilarMovies(movieID: movieId) { similarMovies in
            self.similarMovies = similarMovies
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.delegate?.updateTableView()
        }
    }
    
    
}
