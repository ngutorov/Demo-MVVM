//
//  TopMoviesViewController+Helpers.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension TopMoviesViewController {
    
    func pullRefreshMovieList() {
        
        fetchMovieList()
        refreshControl.endRefreshing()
        reloadTableView()
    }
    
    func fetchMovieList() {
        
        if ConnectionCheck.isConnectedToNetwork() {
            viewModel.fetchMovieList()
            
        } else {
            showAlert(title: "No network connection!",
                      message: "Please check your connection and restart the application.",
                      showCancel: false,
                      okLabel: "Try again") { [weak self] in
                        self?.fetchMovieList()
            }
        }
    }
    
    func prepareViewModelObserver() {

        self.viewModel.movieDidChange = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        
        DispatchQueue.main.async {
           self.tableView.reloadData()
        }
    }
}
