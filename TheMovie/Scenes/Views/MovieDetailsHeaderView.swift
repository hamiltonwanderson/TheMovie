//
//  MovieDetailsHeaderView.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 24/02/22.
//

import UIKit

class MovieDetailsHeaderView: UIView {
    
    let gradient = CAGradientLayer()
    
    lazy var likeImageView: UIImageView = {
        let likeImage = UIImageView()
        let heart = UIImage(systemName: "heart.fill")
        let config = UIImage.SymbolConfiguration(paletteColors: [.white])
        
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.preferredSymbolConfiguration = config
        likeImage.image = heart
        likeImage.contentMode = .scaleAspectFill
        return likeImage
    }()
    
    lazy var viewsImageView: UIImageView = {
        let viewsImage = UIImageView()
        let eye = UIImage(systemName: "eye.circle.fill")
        let config = UIImage.SymbolConfiguration(paletteColors: [.white])
        
        viewsImage.translatesAutoresizingMaskIntoConstraints = false
        viewsImage.preferredSymbolConfiguration = config
        viewsImage.image = eye
        viewsImage.contentMode = .scaleAspectFill
        return viewsImage
    }()
    
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.text = ""
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return titleLabel
    }()
    
    lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.textColor = .white
        likesLabel.text = ""
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        return likesLabel
    }()
    
    lazy var watchedLabel: UILabel = {
        let watchedLabel = UILabel()
        watchedLabel.translatesAutoresizingMaskIntoConstraints = false
        watchedLabel.textColor = .white
        watchedLabel.text = ""
        watchedLabel.font = UIFont.systemFont(ofSize: 16)
        return watchedLabel
    }()

    init(movieDetails: MovieDetails) {
        super.init(frame: .zero)
        
        setupUI()
        setupConstraints()
        setupData(movieDetails: movieDetails)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(movieDetails: MovieDetails) {
        
        let url = TheMovieAPI.getImageURL(posterPath: movieDetails.posterPath)
        movieImageView.kf.setImage(with: url)
        
        movieTitleLabel.text = movieDetails.title
        likesLabel.text = "\(movieDetails.voteCount) Likes"
        
        if movieDetails.popularity >= 1 {
            watchedLabel.text = "\(movieDetails.popularity.formatted())K Views"
        }
        
        let likesDouble = Double(movieDetails.voteCount) / 1000
        likesLabel.text = "\(likesDouble.formatted())K Likes"

    }
    
    private func setupUI() {
        
        addSubview(movieImageView)
        setupGradientLayer()
        addSubview(movieTitleLabel)
        addSubview(likeImageView)
        addSubview(likesLabel)
        addSubview(viewsImageView)
        addSubview(watchedLabel)
    }
    
    private func setupGradientLayer() {
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.45, 1]
        layer.addSublayer(gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = bounds
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 450),
            
            likeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            likeImageView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -20),
            
            likesLabel.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 5),
            likesLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -20),
            
            viewsImageView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 30),
            viewsImageView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -20),
            
            watchedLabel.leadingAnchor.constraint(equalTo: viewsImageView.trailingAnchor, constant: 5),
            watchedLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -20),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            movieTitleLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -5),
        ])
    }
}

