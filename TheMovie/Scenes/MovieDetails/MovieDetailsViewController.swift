//
//  MovieDetailsViewController.swift
//  TheMovie
//
//  Created by Hamilton Wanderson on 18/02/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var viewModel = MovieDetailsViewModel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewModel.delegate = self
        viewModel.callApi()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        setupConstraints()
        setupTableView()
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SimilarMoviesTableViewCell.self, forCellReuseIdentifier: "SimilarMoviesTableViewCell")
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension MovieDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        450
    }
}

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.similarMovies.results.count
    }    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarMoviesTableViewCell", for: indexPath) as? SimilarMoviesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieDetails = viewModel.similarMovies.results[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let movieDetails = viewModel.movie else { return nil }
        
        let view = MovieDetailsHeaderView(movieDetails: movieDetails)
        
        return view
        
    }
}

extension MovieDetailsViewController: MoviesDetailsViewModelDelegate {
    func updateTableView() {
        self.tableView.reloadData()
    }
}
