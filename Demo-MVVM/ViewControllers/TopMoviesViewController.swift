//
//  TopMoviesViewController.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class TopMoviesViewController: UIViewController {
    
    //MARK: - Internal Properties
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    let viewModel = TopMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        prepareViewModelObserver()
        fetchMovieList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.separatorStyle = .singleLine
    }
    
    //MARK: - Prepare UI
    
    func prepareUI() {
        self.view.backgroundColor = UIColor(named: "MainColor")
        self.title = "Top Movies"
        
        addTableView()
        setTableViewConstraints()
    }
    
    func addTableView() {
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.refreshControl = refreshControl
        tableView.separatorStyle = .none
        tableView.rowHeight = 140
        tableView.backgroundColor = UIColor(named: "MainColor")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "TopMoviesViewCell", bundle: nil), forCellReuseIdentifier: "TopMoviesViewCell")
        
        refreshControl.addTarget(self, action: #selector(refreshMoviesData(_:)), for: .valueChanged)
    }
    
    //MARK: - Actions
    
    @objc private func refreshMoviesData(_ sender: Any) {
        pullRefreshMovieList()
    }
}
