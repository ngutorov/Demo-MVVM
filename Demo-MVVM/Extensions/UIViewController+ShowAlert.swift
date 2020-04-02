//
//  UIViewControllerExtension.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/31/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, showCancel: Bool, okLabel: String, okActionClosure: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: okLabel, style: .default, handler: {(action) -> Void in okActionClosure() }))
            
            if showCancel {
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
