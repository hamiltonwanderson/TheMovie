//
//  Movie.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 18/02/22.
//

import Foundation

struct MovieDetails: Codable {
    let title: String
    let voteCount: Int
    let popularity: Double
    let id: Int
    let posterPath: String
    let releaseDate: String
    let genreIds: [Int]?

    enum CodingKeys: String, CodingKey {
        case title
        case voteCount = "vote_count"
        case popularity
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
    
    var genresString: String {
        
        var genreString = ""
        
        if let genreIds = genreIds {
            for genreId in genreIds {
                if  genreId != genreIds.first {
                    genreString += ", "
                }
                
                switch genreId {
                case 28:
                    genreString += "Action"
                case 12:
                    genreString += "Adventure"
                case 16:
                    genreString += "Animation"
                case 35:
                    genreString += "Comedy"
                case 80:
                    genreString += "Crime"
                case 99:
                    genreString += "Documentary"
                case 18:
                    genreString += "Drama"
                case 10751:
                    genreString += "Family"
                case 14:
                    genreString += "Fantasy"
                case 36:
                    genreString += "History"
                case 27:
                    genreString += "Horror"
                case 10402:
                    genreString += "Music"
                case 9648:
                    genreString += "Mystery"
                case 10749:
                    genreString += "Romance"
                case 878:
                    genreString += "Science Fiction"
                case 10770:
                    genreString += "TV Movie"
                case 53:
                    genreString += "Thriller"
                case 10752:
                    genreString += "War"
                case 37:
                    genreString += "Western"
                default:
                    break
                }
            }
        }
        
        return genreString
        
    }
}
