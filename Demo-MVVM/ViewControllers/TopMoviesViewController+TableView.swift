//
//  TopMoviesViewController+TableView.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

// MARK: - UITableView Delegate And Datasource

extension TopMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopMoviesViewCell", for: indexPath as IndexPath) as? TopMoviesViewCell else {
            fatalError("Cell cell is not found!")
        }
        
        let movie = viewModel.movies![indexPath.row]
        cell.movieItem = movie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = viewModel.movies![indexPath.row]
        
        if let detailViewController = Bundle.main.loadNibNamed("TopMoviesDetailView", owner: nil, options: nil)?.first as? TopMoviesDetailViewController {
            detailViewController.movieItem = movie
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
