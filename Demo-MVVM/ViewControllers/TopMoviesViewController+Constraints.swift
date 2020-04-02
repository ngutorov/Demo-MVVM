//
//  TopMoviesViewController+Constraints.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/26/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension TopMoviesViewController {
    
    func setTableViewConstraints() {
        
        // MARK: - tableView constarints:
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
