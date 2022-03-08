//
//  SimilarMoviesTableViewCell.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 24/02/22.
//

import UIKit
import Kingfisher

class SimilarMoviesTableViewCell: UITableViewCell {
    
    lazy var posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.image = UIImage()
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.clipsToBounds = true
        return posterImageView
    }()
    
    lazy var movieTitleLabel: UILabel = {
       let movieTitle = UILabel()
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.textColor = .white
        movieTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return movieTitle
    }()
    
    lazy var yearLabel: UILabel = {
       let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.textColor = .white
        yearLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return yearLabel
    }()
    
    lazy var genreLabel: UILabel = {
       let genreLabel = UILabel()
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.textColor = .white
        genreLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return genreLabel
    }()
    
    var movieDetails: MovieDetails? {
        didSet {
            movieTitleLabel.text = movieDetails?.title
            
            let url = TheMovieAPI.getImageURL(posterPath: movieDetails!.posterPath)
            posterImageView.kf.setImage(with: url)
            
            yearLabel.text = movieDetails?.releaseDate.components(separatedBy: "-").first
            genreLabel.text = movieDetails?.genresString
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(genreLabel)
        
        contentView.backgroundColor = .black
    }

    private func setupConstraints() {
                
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 80),
            
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 65),
            posterImageView.widthAnchor.constraint(equalToConstant: 50),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            movieTitleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -2),
            movieTitleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            
            yearLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
            yearLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            
            genreLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
            genreLabel.leadingAnchor.constraint(equalTo: yearLabel.trailingAnchor, constant: 10),
        ])
    }
    
}
